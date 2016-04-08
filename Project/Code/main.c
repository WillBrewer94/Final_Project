/* 
===========================================================================================
=======================Project Statement and Progress by Will Brewer=======================
===========================================================================================
==
== My game is going to be a side-scrolling 2D combat game, tenatively called 'RESPAWN'
== 
== Main Game Loop:
== When the player starts the game, they will be dropped in the world,
== and monsters will start to assault them from both directions. The player
== must try to survive as long as possible by killing the monsters with their 
== weapons and abilities. Once they run out of health, the game ends.
==
== Game Specifications:
== -2D side-scroller with boundries (approximately 1 screen left and right 
==  of the starting area)
== -Game state will use tiled background, and 3 parralax layers (ground, mountains, sky)
== -Enemies will randomly spawn off the screen and start pursuing the player,
==	which will be implemented with a linked-list
== -Enemies will try to occupy the same space as the player, and if a collision
==  is detected, the player will be knocked back and take damage
== -The player has a series of attacks and abilities at their disposal:
== 		--Melee (gives the character forward momentum, like a "dash")
==		--Jump (also allows dashing while mid-air)
==		--A combo meter that increases each time an enemy is hit, and 
==		  goes to zero once damage is taken
==		--Once the combo meter is "charged", the player can pause time
==		  and attack several enemies at once
==
== What's done:
== -Player physics
== -State Machine
== -Dash attack physics
== -Jumping Physics
== -Several art assets that will be included with the Milestone 2 submission
==
== What needs to be done:
== -LinkedList implementation
== -Enemy logic and physics
== -Tiled map implementation
== -Special attack logic
== -Combo meter logic
== -Health system
== -Finishing up and polishing remaining sprites for enemies and player
== -Parallax scrolling for backgrounds
== -Sound
== -Scrolling
==
== Current Bugs:
== -The game state bugs out when I try to switch through my state machine. It happens
==  intermittently, so I'm not sure whats causing it yet
==
===========================================================================================
===========================================================================================
===========================================================================================
*/

#include <stdlib.h>
#include "myLib.h"
#include "engine.h"
#include "splash.h"
#include "pause.h"
#include "win.h"
#include "lose.h"

//Buttons
extern unsigned int buttons;
extern unsigned int oldButtons;

//State
extern int state;


//=========================================================
// STATE MACHINE						
//=========================================================

int main() {

	initializeStart();

	while(1) {
		oldButtons = buttons;
		buttons = BUTTONS;

		//State Machine
		switch(state) {
			case STARTSCREEN :
				start();
				break;
			case GAMESCREEN :
				game();
				break;
			case WINSCREEN :
				win();
				break;
			case LOSESCREEN :
				lose();
				break;
			case PAUSESCREEN :
				pause();
				break;
		}
	}
}


//=========================================================
// STATE MACHINE METHODS					
//=========================================================

void initializeStart() {
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;

	loadPalette(splashPal);

	drawBackgroundImage4(splashBitmap);
	flipPage();
	drawBackgroundImage4(splashBitmap);

	state = STARTSCREEN;
}

void start() {
	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeGame();
	}
}

void initializePause() {
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;

	state = PAUSESCREEN;
}

void pause() {
	drawBackgroundImage4(pauseBitmap);
	flipPage();
	drawBackgroundImage4(pauseBitmap);

	if(BUTTON_PRESSED(BUTTON_START)) {
		fillScreen4(BLACK);
		flipPage();
		fillScreen4(BLACK);

		REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
		initGraphics();

		state = GAMESCREEN;
	}
}

void initializeWin() {
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;

	state = WINSCREEN;
}

void win() {
	drawBackgroundImage4(winBitmap);
	flipPage();
	drawBackgroundImage4(winBitmap);

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeGame();
	}
}

void initializeLose() {
	REG_DISPCTL = MODE4 | BG2_ENABLE | BUFFER2;

	state = LOSESCREEN;
}

void lose() {
	drawBackgroundImage4(loseBitmap);
	flipPage();
	drawBackgroundImage4(loseBitmap);

	if(BUTTON_PRESSED(BUTTON_START)) {
		initializeGame();
	}
}