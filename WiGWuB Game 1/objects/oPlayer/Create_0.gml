/// @description Read
//oPlayer is currently built for the PlaceholderCharacter character only.
//Oplayer should be updated later to function properly with other characters and multiple players.

randomize();
pID = irandom_range(1, 10000);

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();

enum PLAYERSTATE
{
	FREE,
	ATTACK
}

healthbarX = (120/2) - (healthbarWidth/2);
healthbarY = ystart - 200;