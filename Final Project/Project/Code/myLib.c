/* 
========================== myLib.c ============================
==
== Contains my C library functions:
== -DMA
== -MODE3, MODE4 low-level drawing functions (MODE0 in display.c)
== -Image and palette loading
== -LinkedLists
===============================================================
*/

#include <stdio.h>
#include <stdlib.h>
#include "myLib.h"

unsigned short *videoBuffer = (u16 *)0x6000000;
unsigned short *frontBuffer = (u16 *)0x6000000;
unsigned short *backBuffer =  (u16 *)0x600A000;

DMA *dma = (DMA *)0x40000B0;


//=========================================================
// MODE3 DRAWING FUNCTIONS					
//=========================================================

void setPixel3(int row, int col, unsigned short color) {
	videoBuffer[M3OFFSET(row,col)] = color;
}

void drawRect3(int row, int col, int width, int height, unsigned short color) {
	int r, c;

	for(r = 0; r <= height; r++){
		for(c = 0; c <= width; c++){
			setPixel3(row+r, col+c, color);
		}
	}
}


//=========================================================
// MODE4 DRAWING FUNCTIONS					
//=========================================================

void setPixel4(int row, int col, unsigned char colorIndex) {
	int pixelNumber = M4OFFSET(row, col, 240);
	int shortNumber = pixelNumber / 2;
	unsigned short theShort = videoBuffer[shortNumber];

	if(col & 1) {
		videoBuffer[shortNumber] = (theShort & 0x00FF) | (colorIndex << 8);
	} else {
		videoBuffer[shortNumber] = (theShort & 0xFF00) | (colorIndex);
	}
}

void fillScreen4(unsigned char colorIndex) {
	volatile unsigned short pixels = (colorIndex << 8) | (colorIndex);
	DMANow(3, &pixels, videoBuffer, ((240 * 160)/2) | DMA_SOURCE_FIXED);
}

void drawBackgroundImage4(volatile const unsigned short* image) {
    DMANow(3, image, videoBuffer, ((240 * 160)/2) | DMA_SOURCE_INCREMENT);
}

void drawRect4(int row, int col, int height, int width, unsigned char colorIndex) {
	volatile unsigned short pixels = colorIndex << 8 | colorIndex; // This combines the index into a short so we can copy it easily

	for(int r = 0; r < height; r++) {
		if(col & 1 && width & 1) {
			setPixel4(row + r, col, colorIndex);
			DMANow(3, &pixels, &videoBuffer[M4OFFSET(row + r, col + 1, 240)/2], width/2 | DMA_SOURCE_FIXED);
		}
		if(!(col & 1) && width & 1) {
			setPixel4(row + r, col + width - 1, colorIndex);
		}
		if(col & 1 && !(width & 1)) {
			setPixel4(row + r, col, colorIndex);
			setPixel4(row + r, col + width - 1, colorIndex);
			DMANow(3, &pixels, &videoBuffer[M4OFFSET(row + r, col + 1, 240)/2], (width - 1)/2 | DMA_SOURCE_FIXED);
		}
		if(!(col & 1) && !(width & 1)) {
			DMANow(3, &pixels, &videoBuffer[M4OFFSET(row + r, col, 240)/2], width/2 | DMA_SOURCE_FIXED);
		}
	}
}

void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width) {
	for(int r = 0; r < height; r++) {
		DMANow(3, &image[M4OFFSET(r, 0, width)/2], &videoBuffer[M4OFFSET(row + r, col, 240)/2], width/2 | DMA_SOURCE_INCREMENT);
	}
}

void flipPage() {
    if(REG_DISPCTL & BUFFER2) {
        REG_DISPCTL &= ~BUFFER2;
        videoBuffer = backBuffer;
    } else {
        REG_DISPCTL |= BUFFER2;
        videoBuffer = frontBuffer;
    }
}


//=========================================================
// DMA, PALETTES, VBLANK				
//=========================================================

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control) {
	dma[channel].src = source;
	dma[channel].dst = destination;
	dma[channel].cnt = DMA_ON | control;
}

void loadPalette(volatile const unsigned short* palette) {
    DMANow(3, palette, PALETTE, 256 | DMA_SOURCE_INCREMENT);
}

void waitForVblank() {
	while(SCANLINECOUNTER > 160);
	while(SCANLINECOUNTER < 160);
}

void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb) {
	unsigned short newMap[mapLen];
	int i;
	for(i = 0; i < mapLen; i++) {
		unsigned short maskedNum = map[i] & ~(ATTR2_PALBANK(0xF));
		newMap[i] = maskedNum | ATTR2_PALBANK(palIndex);
		
	}
	DMANow(3, newMap, &SCREENBLOCKBASE[sbb], mapLen);
}


//=========================================================
// LINKEDLISTS				
//=========================================================

//Adds item to beginning of list
void addItem(NODE **head_ref, MOVOBJ newEnemy) {
	NODE *new_node;

	new_node = (NODE *) malloc(sizeof(NODE));
	new_node->enemy = newEnemy;
	new_node->next = *head_ref;
	*head_ref = new_node;
}

void deleteNode(NODE *head, NODE *n) {
	//When node to be deleted is head node
	if(head == n) {
		if(head->next != NULL) {
			//Copy the data of the next node to head
			head->enemy = head->next->enemy;

			//Store address of the next node
			n = head->next;

			//Remove the link of next node
			head->next = head->next->next;

			//Free memory
			free(n);

			return;
		}

	} else {

		//Find the previous node
		NODE *prev = head;

		while(prev->next != NULL && prev->next != n) {
			prev = prev->next;
		}

		//Check if node really exists in linked list
		if(prev->next == NULL) {
			return;
		}

		//Remove node from linked list
		prev->next = prev->next->next;

		//Free memory
		free(n);

		return;
	}
}