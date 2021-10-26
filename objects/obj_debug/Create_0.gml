/// @description Insert description here
// You can write your code in this editor

//jump_bump: jump and headbump the item to activate (item blocks), 
//press_down: simply press down to activate (item should probaly implement waiting a few frames
enum obj_action_inputs{
	jump_bump,
	press_down,
	general_col
}


//room_set_live(room0, true);

//Kill_Player SudoScript
kill_plr = false
kill_plr_timer = 0
kill_plr_statechange = -1

finish_lvl_startx = 0
finish_lvl = false
finish_lvl_timer = 0
finish_lvl_walk = -1

win_mus = 0
menu_mus = 0
lvl_mus = 0
credits_mus = 0

fade = 0
spawnedfade = false
changing_lvl = false

menu_gotoroom = 0

credits_timer = 0

if (room == rm_menu){
	fade = instance_create_layer(0 ,0, "Collision", obj_fadeblack)	
	fade.depth = -100
	fade.image_alpha = 1
}
else if (room == rm_lvl1 or room == rm_lvl2){
	if (!audio_is_playing(mus_lvl) ){
	//	lvl_mus = audio_play_sound(mus_lvl, 0, false)
	}
	
}