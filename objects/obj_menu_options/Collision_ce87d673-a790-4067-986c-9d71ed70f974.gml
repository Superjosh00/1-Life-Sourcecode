/// @description Insert description here
// You can write your code in this editor

obj_plr.can_move = false
obj_plr.can_jump = false

fade = instance_create_layer(0 ,0, "Collision", obj_fadeblack)	
fade.depth = -100

if start{
	obj_debug.menu_gotoroom = rm_lvl1
	audio_sound_gain(obj_debug.menu_mus, 0, 1000)	
}
else if credits{
	obj_debug.menu_gotoroom = rm_credits
	audio_sound_gain(obj_debug.menu_mus, 0, 1000)	
}
else if Exit{
	obj_debug.menu_gotoroom = rm_exitgame
}








