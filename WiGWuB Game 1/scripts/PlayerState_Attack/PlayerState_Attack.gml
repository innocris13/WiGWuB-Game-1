function PlayerState_Attack(_weaponDamage)
{
	//hsp = 0;
	//vsp = 0;

	//Start Attack
	if(sprite_index != sPlaceholderCharacterGreatswordAttack)
	{
		sprite_index = sPlaceholderCharacterGreatswordAttack;
		oGreatsword.x = oPlayer.x;
		oGreatsword.y = oPlayer.y;
		oGreatsword.visible = true;
		oGreatsword.image_index = 0;
		//Weapon attack image flips based on oPlayer orientation
		oGreatsword.image_xscale = oPlayer.image_xscale;
		image_index = 0;
		ds_list_clear(hitByAttack);
		
		
	}

	//Use attack hitbox and check for hits
	mask_index = sNormalGreatsword;
	var hitByAttackNow = ds_list_create(); //Enemies hit by attack now
	var hits = instance_place_list(x,y,oEnemy,hitByAttackNow,false); //Number of hits that happened this attack
	//if (place_meeting(x,y,pHitable))
	//{
	//	with (instance_place(x,y,pHitable))
	//	{
	//		flash = 2;
	//	}
	//}
	if(hits > 0)
	{
		for(var i = 0; i < hits; i++)
		{
			//If enemy hasn't been hit by this attack
			var hitID = hitByAttackNow[| i]; //same as ds_list_find_value(hitByAttackNow, i);
			if(ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with(hitID)
				{
					if(enemyHealth  > 0)
					{
						enemyHealth -= _weaponDamage;
						lastHitDirection = other.direction;
						flash = 2;
					}
				}
			}
		}
	}

	ds_list_destroy(hitByAttackNow);
	mask_index = sPlaceholderCharacterIdle;

	if(animation_End())
	{
		sprite_index = sPlaceholderCharacterIdle;
		oGreatsword.visible = false;
		state = PLAYERSTATE.FREE;
	}
}