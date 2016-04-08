/*
========================== display.c ============================
==
== Contains the methods that control what is displayed on screen:
== -Animation
== -Showing and hiding sprites
== -OAM functions
==================================================================
*/

#include "display.h"

//Sprite memory
OBJ_ATTR shadowOAM[128];

int aniIsFinish = 1;


//=========================================================
// SPRITE DRAWING FUNCTIONS					
//=========================================================

void hideSprites() {
	for(int i = 0; i < 128; i++) {
		shadowOAM[i].attr0 = ATTR0_HIDE;
	}
}

//Updates OAM for player and enemies
void updateOAM(MOVOBJ* sprite, int index) {
	shadowOAM[index].attr0 = (ROWMASK & SHIFTDOWN(sprite->row)) | ATTR0_4BPP | sprite->shape;
	shadowOAM[index].attr1 = (COLMASK & SHIFTDOWN(sprite->col)) | sprite->size | sprite->flip;
	shadowOAM[index].attr2 = SPRITEOFFSET16(2 * sprite->currFrame, 4 * sprite->prevAniState);

	if(sprite->isHide) {
		shadowOAM[index].attr0 |= ATTR0_HIDE;
	}

	DMANow(3, shadowOAM, OAM, 512);
}


//=========================================================
// SPRITE ANIMATION FUNCTIONS					
//=========================================================

void animate() {
	animatePlayer();
	animateEnemies();
	animateUI();
}

void animatePlayer() {
	player.prevAniState = player.aniState;

	if(player.aniCounter % 4 == 0) {
		player.aniCounter = 0;

		if((player.currFrame == 3 && player.prevAniState == PLAYERATTACK) || player.currFrame == 9) {
			player.currFrame = 0;
			aniIsFinish = 1;
		} else {
			player.currFrame++;
		}
	}

	if(aniIsFinish) {
		player.aniState = PLAYERIDLE;

		if(BUTTON_HELD(BUTTON_LEFT)) {
			player.aniState = PLAYERRUN;
			player.flip = ATTR1_HFLIP;
		}

		if(BUTTON_HELD(BUTTON_RIGHT)) {
			player.aniState = PLAYERRUN;
			player.flip = 0;
		}

		if(BUTTON_PRESSED(BUTTON_A)) {
			player.aniState = PLAYERJUMP;
			aniIsFinish = 0;
			player.currFrame = 0;
		}

		if(BUTTON_PRESSED(BUTTON_B)) {
			player.aniState = PLAYERATTACK;
			aniIsFinish = 0;
			player.currFrame = 0;
		}

		if(BUTTON_PRESSED(BUTTON_L)) {
			//player.aniState = PLAYERDASH;
		}

		if(BUTTON_PRESSED(BUTTON_R)) {
			//player.aniState = PLAYERSMASH;
		}
	}

	updateOAM(&player, 0);

	player.aniCounter++;
}

void animateEnemies() {
	NODE *nextEnemy = head;
	int oamCounter = 2;

	while(nextEnemy != 0) {
		MOVOBJ* currEnemy = &(nextEnemy->enemy);

		currEnemy->prevAniState = 13;
		currEnemy->currFrame = 0;

		updateOAM(currEnemy, oamCounter);
		oamCounter++;
		
		nextEnemy = nextEnemy->next;
	}
}

void animateUI() {
	shadowOAM[1].attr0 = (ROWMASK & 0) | ATTR0_4BPP | ATTR0_WIDE;
	shadowOAM[1].attr1 = (COLMASK & 0) | ATTR1_SIZE64;
	shadowOAM[1].attr2 = SPRITEOFFSET16(0, 18);
	DMANow(3, shadowOAM, OAM, 512);

	/*if(jfdfadsja;fldsa) {
		SPRITE_PALETTE[17] = 
	}*/
}

void initGraphics() {
	int sbb;

	//Switch to MODE0 for Game
	REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

	REG_BG0CNT = CBB(0) | SBB(30) | BG_SIZE1;
	REG_BG1CNT = CBB(1) | SBB(20) | BG_SIZE1;

	//Initialize backgrounds
	loadPalette(tilemap_ground_v1Pal);
	DMANow(3, tilemap_ground_v1Tiles, &CHARBLOCKBASE[0], tilemap_ground_v1TilesLen/2);
	DMANow(3, tilemap_ground_v1Map, &SCREENBLOCKBASE[30], tilemap_ground_v1MapLen/2);

    DMANow(3, tilemap_mountainsv1Tiles, &CHARBLOCKBASE[1], tilemap_mountainsv1TilesLen/2);
    DMANow(3, tilemap_mountainsv1Map, &SCREENBLOCKBASE[20], tilemap_mountainsv1MapLen/2);
	sbb = 28;
	//loadMap(tilemap_mountainsv1Map, tilemap_mountainsv1MapLen/2, 1, sbb);
	
	DMANow(3, sprite_sheet_v1Tiles, &CHARBLOCKBASE[4], sprite_sheet_v1TilesLen/2);
	DMANow(3, sprite_sheet_v1Pal, SPRITE_PALETTE, sprite_sheet_v1PalLen/2);
}