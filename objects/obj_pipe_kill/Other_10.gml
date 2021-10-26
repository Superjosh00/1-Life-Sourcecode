/// @description Insert description here
// You can write your code in this editor


if (!activated){
	if (obj_plr.bbox_left > bbox_left + 2 && obj_plr.bbox_right < bbox_right - 2){
		startup_timer ++
		startup_canceltimer = 3
	}
}

if (startup_timer == 10){

	layer = layer_get_id("Foreground_Instances")

	startup_timer = 0	
	startup_canceltimer = 0
	
	obj_plr.can_move = false
	obj_plr.can_jump = false
	obj_plr.position_correction = false
	obj_camera.following = false
	obj_plr.hsp = 0
	obj_plr.vsp = 0
	
	
	activated = true
}



