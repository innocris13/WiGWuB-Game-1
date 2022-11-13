//Get Player Input

if (hascontrol)
{
	key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);
	key_weapon_attack = mouse_check_button(mb_left);

	if (key_left) or (key_right) or (key_jump) or (key_weapon_attack)
	{
		controller = 0;	
	}

	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 1;	
	}

	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}
	
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
	key_weapon_attack = 0;
}

switch(state)
{
	case(PLAYERSTATE.FREE):	
		PlayerState_Free();
		break;
	case(PLAYERSTATE.ATTACK):
		PlayerState_Attack(equippedWeaponDamage);
		break;
}