/// @description Read
//oPlayer is currently built for the PlaceholderCharacter character only.
//Oplayer should be updated later to function properly with other characters and multiple players.

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();

enum PLAYERSTATE
{
	FREE,
	ATTACK
}