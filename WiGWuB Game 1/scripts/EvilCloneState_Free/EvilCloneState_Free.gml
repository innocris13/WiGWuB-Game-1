function EvilCloneState_Free()
{
	//Calculate Movement
	var move = key_right - key_left;

	hsp = move * walksp;

	vsp = vsp + grv;

	canjump -= 1;
	if (canjump > 0) && (key_jump)
	{
		vsp = -7;
		canjump = 0;
	}	

	//Horizontal Collision
	if (place_meeting(x+hsp,y,oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp=0;
	}
	x = x + hsp;

	//Verticle Collision
	if (place_meeting(x,y+vsp,oWall))
	{
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp=0;
	}
	y = y + vsp;

	//Animation
	if (!place_meeting(x,y+1,oWall))
	{
		sprite_index = sEvilCloneAirborn;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else
	{		
		canjump = 10
		if (sprite_index == sEvilCloneAirborn) 
		{
			audio_sound_pitch(snLanding,choose(0.8,1.0,1.2));
			audio_play_sound(snLanding,4,false);
			repeat(5)
			{
				with (instance_create_layer(x,bbox_bottom,"Player",oDust))
				{
					vsp = 0;	
				}
			}
		}
		image_speed = 1;
	
	}

	if(key_weapon_attack && equippedWeapon != "")
		state = EVILCLONESTATE.ATTACK;
		
	if (hsp != 0) image_xscale = sign(hsp);
	
}