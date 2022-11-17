hsp = 0;
vsp = 0;
grv = .2;
done = 0;

ScreenShake(6,60);
audio_play_sound(snLanding,10,false);
game_set_speed(30,gamespeed_fps);
with (oCamera) follow = other.id;