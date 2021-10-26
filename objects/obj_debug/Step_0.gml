/// @description Insert description here
// You can write your code in this editor


#region //Kill Player
	if (kill_plr){
		if (kill_plr_timer = 0){
			obj_camera.following = false
	
			if (kill_plr_statechange){
				//change state do death here	
				with (obj_plr){
					set_state(PS_DEATH)	
				}

			}
	
			show_debug_message("stop music")
			show_debug_message("play death sfx")
		}
		else if(kill_plr_timer = 20){
			show_debug_message("play death mus")
		
		}

		//preferably do check to see if music is done here
		else if (kill_plr_timer = 84){
			fade = instance_create_layer(0 ,0, "Collision", obj_fadeblack)	
			fade.depth = -100
			show_debug_message(fade)
		}
		else if (kill_plr_timer > 84 && fade.image_alpha = 1){
			room_goto(rm_lvl1)
		}

		kill_plr_timer ++
	}
#endregion

//show_debug_message(audio_sound_get_gain(win_mus))
//show_debug_message(finish_lvl_timer)
#region // Finish Level
	if (finish_lvl){
		
		if (finish_lvl_timer == 0){
			obj_plr.can_move = false
			obj_plr.can_jump = false
		}
		else if (finish_lvl_timer == 5){
			if (finish_lvl_walk == true){
				if (finish_lvl_startx > obj_finishlevel_walk.x){
					obj_plr.win_animr = true
					obj_plr.state_timer = 0
					obj_plr.state = obj_plr.PS_WIN
				}
				else {
					obj_plr.win_animl = true
					obj_plr.state_timer = 0
					obj_plr.state = obj_plr.PS_WIN				
				}
				
				obj_camera.win_cam = true
			}
			
		}
		else if (finish_lvl_timer == 20){
			audio_sound_gain(mus_lvl, 0, 500)	
		}
		else if (finish_lvl_timer == 50){
							//fade out any audio playing
			win_mus = audio_play_sound(mus_win, 1, false)	
			audio_sound_gain(win_mus, 1, 0)
		}
		else if (finish_lvl_timer > 50 && !audio_is_playing(mus_win) or finish_lvl_timer > 50 && audio_is_playing(mus_win) && keyboard_check_direct(ord("Z"))){
			show_debug_message(audio_is_playing(mus_win))
			changing_lvl = true
		}
		
		if (changing_lvl){
			if (!spawnedfade){
				fade = instance_create_layer(0 ,0, "Collision", obj_fadeblack)	
				fade.depth = -100
				
					
				if (audio_is_playing(win_mus)){
					audio_sound_gain(win_mus, 0, 1000)	

				}
				spawnedfade = true
			}
			else if (fade.image_alpha = 1){
				switch (room){
					case rm_lvl1: 	room_goto(rm_lvl2) break
					case rm_lvl2: room_goto(rm_demo) break
					case rm_demo: room_goto(rm_credits) break
				}
				audio_stop_sound(mus_lvl)
				
			}
			
			

			
			
		}
	
		finish_lvl_timer ++	
			if (obj_plr.state = obj_plr.PS_LAND or !obj_plr.grounded){
				finish_lvl_timer = 0	
			}
	}
#endregion



#region Menu Control
	if (menu_gotoroom != 0){
		if (obj_fadeblack.image_alpha = 1){
			room_goto(menu_gotoroom) 
			
		}	
	}

	if (room == rm_menu){
		if (!instance_exists(obj_fadeblack)){
			if (obj_title.image_alpha <= 1){
				obj_title.image_alpha += .01
			}
			else if (!instance_exists(obj_plr)){
				instance_create_layer(room_width / 2,  -20, "Instances", obj_plr)	
				obj_plr.image_xscale = .5
				obj_plr.image_yscale = .5
				
				menu_mus = audio_play_sound(mus_title, 0, false)
			}
		
		
		
			//menu_timer ++	
		}
		else{
			obj_title.image_alpha = 0	
		}
	
	}


#endregion


#region // Music Loop
	if (audio_is_playing(menu_mus)){
		if (audio_sound_get_track_position(menu_mus) >= 48.60){
			menu_mus = audio_play_sound(mus_title, 0, false)
		}
		
	}
	else if (audio_is_playing(lvl_mus)){
		if (audio_sound_get_track_position(lvl_mus) >= 86.40){
			lvl_mus = audio_play_sound(mus_lvl, 0, false)
		}
		
	}


#endregion



if (room == rm_lvl1 or room == rm_lvl2){
	if (!instance_exists(obj_fadeblack) && !audio_is_playing(mus_lvl)){
		audio_stop_sound(mus_lvl)
		lvl_mus = audio_play_sound(mus_lvl, 0, false)	
		audio_sound_gain(mus_lvl, .5, 1)

	}
	
}



if (room == rm_credits){
	if (credits_timer  == 300){
		audio_stop_sound(mus_credits)
		
		audio_play_sound(mus_credits, 0, false)
		audio_sound_gain(mus_credits, 1, 0)
	}
	else if (credits_timer > 60 && credits_timer * 1.5 < room_height - 300){
		camera_set_view_pos(view_camera[0], 0, credits_timer * 1.5)
	}
	else if (credits_timer = 2700){
		fade = instance_create_layer(0 ,0, "Instances", obj_fadeblack)	
		fade.depth = -100
	}

	
	
	if (keyboard_check_pressed(ord("Z")) && !instance_exists(obj_fadeblack)){
				fade = instance_create_layer(0 ,0, "Instances", obj_fadeblack)	
				fade.depth = -100
				
				if (audio_is_playing(mus_credits)){
					audio_sound_gain(mus_credits, 0, 1000)
				}
	}

	if (credits_timer > 100 && instance_exists(obj_fadeblack) && obj_fadeblack.image_alpha = 1){
		room_goto(rm_menu)	
	}

	credits_timer ++
}