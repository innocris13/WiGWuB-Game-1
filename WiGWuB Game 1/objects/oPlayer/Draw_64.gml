/// @description Player Health Bar

draw_sprite(sPlayerHealthBarBackground,0,healthbarX,healthbarY);
draw_sprite_stretched(sPlayerHealth,0,healthbarX,healthbarY,(hp/hpMax)*healthbarWidth,healthbarHeight);
draw_sprite(sPlayerHealthBar,0,healthbarX,healthbarY);