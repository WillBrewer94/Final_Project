#ifndef GAME_H
#define GAME_H

//Header files used by engine.c
#include "myLib.h"
#include "display.h"


//=========================================================
// ENUMS						
//=========================================================

//Game States
enum { STARTSCREEN, GAMESCREEN, LOSESCREEN, WINSCREEN, PAUSESCREEN };


//=========================================================
// STRUCTS						
//=========================================================


//=========================================================
// GAME ENGINE PROTOTYPES					
//=========================================================

void update();
void draw();
void updatePlayer();
void playerInput();
void updateEnemies();
void enemyCollisions(NODE* enemy);
void spawner();
void dash(int);
int getRand(int, int);
MOVOBJ createEnemy();


//=========================================================
// GAME STATE PROTOTYPES					
//=========================================================

void start();
void initializeStart();
void game();
void initializeGame();
void pause();
void initializePause();
void win();
void initializeWin();
void lose();
void initializeLose();

#endif