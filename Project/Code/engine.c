/*
========================== engine.c ============================
== 
== Contains methods to drive the game engine: 
== -Game Logic
== -Physics Calculations
== -Input Processing
== -Collisions
================================================================
*/ 

#include <stdlib.h>
#include <time.h>
#include "engine.h"

//Buttons
unsigned int buttons;
unsigned int oldButtons;

//Tile Scroll Variables
int hOff = 0;
int vOff = 20;

//Game Variables
int isOver = 0;
int state;
int timer = 0;
int isDash = 0;
int jumpCount = 0;
int coolDown = 20;
int isAttack = 0;
int frameCount = 0;
int enemyTimer = 0;
int enemyCount = 0;
int isDash;

//Display.h Externs
MOVOBJ player;
NODE *head = 0;
int sbb;


//=========================================================
// GAME LOOP FUNCTIONS						
//=========================================================

void initializeGame() {
	fillScreen4(BLACK);
	flipPage();
	fillScreen4(BLACK);

	initGraphics();

	//Set initial player values
	player.row = SHIFTUP(100);
	player.col = SHIFTUP(120);
	player.size = ATTR1_SIZE32;
	player.shape = ATTR0_WIDE;
	player.rDir = 0;
	player.cDir = 0;
	player.rAcc = 80;
	player.cAcc = 100;
	player.stopRange = 50;
	player.maxHSpeed = SHIFTUP(8);
	player.maxVSpeed = SHIFTUP(5);
	player.isHide = 0;
	hideSprites();

	enemyCount = 0;

	//Initialize Enemy LinkedList head to 0(NULL)
	head = 0;

	//Set up random number generator
	srand(time(NULL));

	state = GAMESCREEN;
}

void game() {
	if(!isOver) {
		update();
		waitForVblank();
		draw();
	}

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializePause();
	}
}

void update() {
	updatePlayer();
	updateEnemies();

	REG_BG0HOFS = hOff;
	REG_BG0VOFS = vOff;

	REG_BG1HOFS = hOff / 2;
	REG_BG1VOFS = vOff;
}

void draw() {
	animate();
}


//=========================================================
// GAME LOGIC FUNCTIONS							
//=========================================================

//=========================
// PLAYER							
//=========================

void updatePlayer() {
	player.rDir += player.rAcc;

	player.row += player.rDir;
	player.col += player.cDir;

	//Gound Collision
	if(SHIFTDOWN(player.row) >= SCREENHEIGHT - 32) {
		player.row = SHIFTUP(SCREENHEIGHT - 32);
		player.rDir = 0;
		jumpCount = 0;
	}

	//Ceiling Collision
	if(SHIFTDOWN(player.row) < 0) {
		player.row = 0;
		player.rDir = 0;
	}

	//Wall Collisions
	if(SHIFTDOWN(player.col) <= 0) {
		player.col = 0;
		player.cDir = 0;
	}

	if(SHIFTDOWN(player.col) >= SCREENWIDTH - 32 - 1) {
		player.col = SHIFTUP(SCREENWIDTH - 32 - 1);
	}

   	//Player deceleration
    if(player.cDir < 0) {
       player.cDir += player.cAcc;
    } else if(player.cDir > 0) {
       player.cDir -= player.cAcc;
    } 

    if(player.cDir < player.stopRange && player.cDir > -player.stopRange) {
       player.cDir = 0;
    } 

    if(player.cDir <= 0) {
   		isDash = 0;
    }

	playerInput(); 
}

void playerInput() {
	//If on player cooldown, stop player input for cooldown timer
	if(isAttack) {
		if(frameCount < coolDown) {
			frameCount++;
		} else {
			isAttack = 0;
		}

	} else {
		frameCount = 0;

		//Player Jumping and double jump
		if(BUTTON_PRESSED(BUTTON_A)) { 
			if(jumpCount < 2) {
				player.rDir = -player.maxVSpeed;
				jumpCount++;
			} 
		}

		//Player Movement, also cancels dash if move in opposite direction
		if(BUTTON_HELD(BUTTON_LEFT)) {
			player.col -= SHIFTUP(2);
			player.flip = ATTR1_HFLIP;
			hOff--;
			if(player.cDir > 0) { 
				player.cDir = 0;
			}
		} else if(BUTTON_HELD(BUTTON_RIGHT)) {
			player.col += SHIFTUP(2);
			player.flip = 0;
			hOff++;
			if(player.cDir < 0) {
				player.cDir = 0;
			}
		}

		//Basic Attack
		if(BUTTON_PRESSED(BUTTON_B)) {
			if(BUTTON_HELD(BUTTON_LEFT)) {
				player.cDir = -1800;
			}

			if(BUTTON_HELD(BUTTON_RIGHT)) {
				player.cDir = 1800;
			}
			
			isAttack = 1;
		}

		//Dash Attack
		if(BUTTON_HELD(BUTTON_LEFT) && BUTTON_PRESSED(BUTTON_L)) {
			dash(-1);
			isDash = 1;
		} else if(BUTTON_HELD(BUTTON_RIGHT) && BUTTON_PRESSED(BUTTON_L)) {
			dash(1);
			isDash = 1;
		}

		if(player.cDir <= 0) {
			isDash = 0;
		}

		//Ground Smash Attack
		if(BUTTON_PRESSED(BUTTON_R) && jumpCount > 0) {
			player.rDir = SHIFTUP(15);
			
		}
	}
}

void dash(int d) {
	player.cDir = d * 3000;
}

//=========================
// ENEMIES		
//=========================

//Spawn an enemy every 60 frames
void spawner() {
	if(enemyTimer == 10 && enemyCount < 50) {
		enemyTimer = 0;
		MOVOBJ newEnemy = createEnemy();

		addItem(&head, newEnemy);
		enemyCount++;

	} else {
		enemyTimer++;
	}
}

MOVOBJ createEnemy() {
	MOVOBJ newEnemy;

	newEnemy.row = SHIFTUP(SCREENHEIGHT);
	newEnemy.col = SHIFTUP(getRand(0, 30));
	newEnemy.rDir = 0;
	newEnemy.cDir = 0;
	newEnemy.rAcc = 150;
	newEnemy.cAcc = 100;
	newEnemy.stopRange = 50;
	newEnemy.isHide = 0;

	newEnemy.size = ATTR1_SIZE32;
	newEnemy.shape = ATTR0_TALL;

	newEnemy.maxHSpeed = SHIFTUP(8);
	newEnemy.maxVSpeed = SHIFTUP(9);

	return newEnemy;
}

void updateEnemies() {
	//spawner();

	NODE *nextEnemy = head;

	while(nextEnemy != 0) {
		MOVOBJ* currEnemy = &(nextEnemy->enemy);

		currEnemy->oldRow = currEnemy->row;
		currEnemy->oldCol = currEnemy->col;

		currEnemy->rDir += currEnemy->rAcc;

		currEnemy->row += currEnemy->rDir;
		currEnemy->col += currEnemy->cDir;

		//Gound Collision
		if(SHIFTDOWN(currEnemy->row) >= SCREENHEIGHT - 32 - 16) {
			currEnemy->row = SHIFTUP(SCREENHEIGHT - 32 - 16);
			currEnemy->rDir = 0;
		}

	   	//Enemy deceleration
	    if(currEnemy->cDir < 0) {
	        currEnemy->cDir += currEnemy->cAcc;
	    } else if(currEnemy->cDir > 0) {
	       currEnemy->cDir -= currEnemy->cAcc;
	    } 

	    if(currEnemy->cDir < currEnemy->stopRange && currEnemy->cDir > -currEnemy->stopRange) {
	        currEnemy->cDir = 0;
	    }

	    //Moves towards player
	    if(currEnemy->col > player.col) {
	    	currEnemy->col -= SHIFTUP(getRand(0,3));
	    	currEnemy->flip = 0;
	    }

	    if(currEnemy->col < player.col) {
	    	currEnemy->col += SHIFTUP(getRand(0, 3));
	    	currEnemy->flip = ATTR1_HFLIP;
	    }

	    enemyCollisions(nextEnemy);

	    nextEnemy = nextEnemy->next;
	} 
}

void enemyCollisions(NODE* currEnemy) {
	MOVOBJ* temp = &(currEnemy->enemy);

	if(SHIFTDOWN(temp->row) + 32 == SHIFTDOWN(player.row) + 16) {
		if(SHIFTDOWN(temp->col) >= SHIFTDOWN(player.col) && SHIFTDOWN(temp->col) <= SHIFTDOWN(player.col)) {
			if(isAttack) {
				temp->isHide = 1;
				//deleteNode(head, currEnemy);
				enemyCount--;
			} else if(!temp->isHide) {
				//initializeLose();
			}
		}
	}
}

//=========================
// HELPER METHODS	
//=========================

int getRand(int min, int max) {
	int random = rand() % max + min;

	return random;
}