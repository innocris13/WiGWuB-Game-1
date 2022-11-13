/// @desc Enemy death code and animation

if(enemyHealth <= 0)
{
	sprite_index = sEnemyDeath;
	image_speed = 1;
	
	if(image_index = sprite_get_number(sprite_index) - 1)
	{
		instance_destroy();
	}
}





