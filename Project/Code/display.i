# 1 "display.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "display.c"
# 11 "display.c"
# 1 "display.h" 1

# 1 "myLib.h" 1



typedef unsigned short u16;
# 56 "myLib.h"
extern unsigned short *videoBuffer;
extern unsigned short *buffer1;
extern unsigned short *buffer2;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;






void drawSprites();
void hideSprites();






void setPixel3(int row, int col,volatile unsigned short color);
void drawRect3(int row, int col, int height, int width,volatile unsigned short color);
void fillScreen3(volatile unsigned short color);






void waitForVblank();
void flipPage();
void setPixel4(int row, int col,volatile unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(volatile unsigned char color);
void drawBackgroundImage4(volatile const unsigned short* image);
void drawImage4(volatile const unsigned short* image, int row, int col, int height, int width);
void loadPalette(volatile const unsigned short* palette);
void drawSubImage4(volatile const unsigned short* sourceImage, int sourceRow, int sourceCol, int sourceWidth,
       int row, int col, int height, int width);
# 112 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 124 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef volatile struct {
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 253 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 279 "myLib.h"
void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb);
# 320 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;

typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int bigRow;
    int bigCol;

    int rDir;
    int cDir;
    int rAcc;
    int cAcc;
    int maxHSpeed;
    int maxVSpeed;
    int stopRange;

    int shape;
    int size;
    int flip;

    int hitPoints;
    int stamina;

    int aniState;
    int aniCounter;
    int prevAniState;
    int currFrame;
    int isHide;
} MOVOBJ;






typedef struct NODE {
    MOVOBJ enemy;
    struct NODE *next;
} NODE;

void addItem(NODE **head_ref, MOVOBJ newEnemy);
void deleteNode(NODE *head, NODE *n);
# 3 "display.h" 2
# 1 "tilemap_ground_v1.h" 1
# 22 "tilemap_ground_v1.h"
extern const unsigned short tilemap_ground_v1Tiles[160];


extern const unsigned short tilemap_ground_v1Map[3072];


extern const unsigned short tilemap_ground_v1Pal[256];
# 4 "display.h" 2
# 1 "tilemap_mountainsv1.h" 1
# 22 "tilemap_mountainsv1.h"
extern const unsigned short tilemap_mountainsv1Tiles[5792];


extern const unsigned short tilemap_mountainsv1Map[3072];


extern const unsigned short tilemap_mountainsv1Pal[256];
# 5 "display.h" 2
# 1 "sprite_sheet_v1.h" 1
# 21 "sprite_sheet_v1.h"
extern const unsigned short sprite_sheet_v1Tiles[16384];


extern const unsigned short sprite_sheet_v1Pal[256];
# 6 "display.h" 2






extern MOVOBJ player;


extern NODE *head;






enum { PLAYERIDLE, PLAYERRUN, PLAYERJUMP, PLAYERATTACK };
enum { ENEMYLEFT = 1, ENEMYRIGHT, ENEMYATTACK, ENEMYDIE };






void hideSprites();
void animate();
void animatePlayer();
void animateEnemies();
void animateUI();
void updateOAM();
void initGraphics();
# 12 "display.c" 2


OBJ_ATTR shadowOAM[128];

int aniIsFinish = 1;






void hideSprites() {
 for(int i = 0; i < 128; i++) {
  shadowOAM[i].attr0 = (2 << 8);
 }
}


void updateOAM(MOVOBJ* sprite, int index) {
 shadowOAM[index].attr0 = (0xFF & ((sprite->row) >> 8)) | (0 << 13) | sprite->shape;
 shadowOAM[index].attr1 = (0x1FF & ((sprite->col) >> 8)) | sprite->size | sprite->flip;
 shadowOAM[index].attr2 = (2 * sprite->currFrame)*32+(4 * sprite->prevAniState);

 if(sprite->isHide) {
  shadowOAM[index].attr0 |= (2 << 8);
 }

 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}






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

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
   player.aniState = PLAYERRUN;
   player.flip = (1 << 12);
  }

  if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
   player.aniState = PLAYERRUN;
   player.flip = 0;
  }

  if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
   player.aniState = PLAYERJUMP;
   aniIsFinish = 0;
   player.currFrame = 0;
  }

  if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
   player.aniState = PLAYERATTACK;
   aniIsFinish = 0;
   player.currFrame = 0;
  }

  if((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {

  }

  if((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {

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
 shadowOAM[1].attr0 = (0xFF & 0) | (0 << 13) | (1 << 14);
 shadowOAM[1].attr1 = (0x1FF & 0) | (3 << 14);
 shadowOAM[1].attr2 = (0)*32+(18);
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);




}

void initGraphics() {
 int sbb;


 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);

 *(volatile unsigned short*)0x4000008 = 0 << 2 | 30 << 8 | 1<<14;
 *(volatile unsigned short*)0x400000A = 1 << 2 | 20 << 8 | 1<<14;


 loadPalette(tilemap_ground_v1Pal);
 DMANow(3, tilemap_ground_v1Tiles, &((charblock *)0x6000000)[0], 320/2);
 DMANow(3, tilemap_ground_v1Map, &((screenblock *)0x6000000)[30], 6144/2);

    DMANow(3, tilemap_mountainsv1Tiles, &((charblock *)0x6000000)[1], 11584/2);
    DMANow(3, tilemap_mountainsv1Map, &((screenblock *)0x6000000)[20], 6144/2);
 sbb = 28;


 DMANow(3, sprite_sheet_v1Tiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, sprite_sheet_v1Pal, ((unsigned short*)(0x5000200)), 512/2);
}
