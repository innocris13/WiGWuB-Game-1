/// @description Inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

//Store number of options in current menu
op_length = array_length(option[menu_level]);

//move through the menu
pos += down_key - up_key;
if pos >= op_length 
{
	pos = 0;
}
if pos < 0 
{
	pos = op_length-1;
}

//using the options
if accept_key 
{
	var _sml = menu_level;
	switch(menu_level)
		{
			//Title menu
			case 0:
				switch(pos)
					{
						//start game
						case 0: 
							room_goto_next(); 
							break;
						//settings
						case 1: 
							menu_level = 1; 
							break;
						//exit game
						case 2: 
							game_end(); 
							break;
						case 3: 
							room_goto(rServer);
							break;
						case 4: 
							room_goto(Room1);
							break;
					}
				break;
				
			//Setting menu
			case 1:
				switch(pos)
					{
						//fullscreen
						case 0: 
							window_set_fullscreen(!window_get_fullscreen());
							break;
						//brightness
						case 1: 
							break;
						//controls
						case 2: 
							break;
						//back
						case 3: 
							menu_level = 0; 
							break;
					}
		}
		
	if _sml != menu_level 
		{
			pos = 0;
		}
		
//correct option length
op_length = array_length(option[menu_level]);

}