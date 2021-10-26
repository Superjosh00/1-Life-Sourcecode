/// @description Insert description here
// You can write your code in this editor



if (grounded && state != PS_WIN && can_move && keyboard_check_pressed(ord("F"))){
	y -= 1
}


if (jumploop){
	
	if (grounded && state != PS_JUMP){
			state = PS_JUMP
				cur_jump = 0
				multjump_var = false
				image_index = 0
				var state_name = get_state_name(state)
				var cur_state = string_delete(state_name, 1, 3);
				sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
				state_timer = 0	
				vsp = 2
	}
}



state_timer ++

#region //Incrementers
	if (multijump_timer > 0){
		multijump_timer --
	
		if (multijump_timer == 0 && cur_jump > 0 && multjump_var == true){
			multjump_var = false
			cur_jump = 0

		}

	}

	if (walljump_timer > 0){
		walljump_timer --	
	}


	if (jumpbuffer_timer > 0){
		jumpbuffer_timer --	
	}
#endregion

#region //General Misc.
	if (jumpbuffer_timer == 0 && keyboard_check_pressed(ord("Z"))){
		jumpbuffer_timer = 4
	}

#endregion


#region //Air/Ground Friction
	#region //Ground
		if (grounded){
			if (hsp > 0){
				var new_hsp = hsp - ground_fric
				if (new_hsp >= 0){
					hsp = new_hsp
				}
				else{
					hsp = 0	
				}
			}
			else if (hsp < 0){
				//hsp += air_fric	
	
				var new_hsp = hsp + ground_fric
				if (new_hsp <= 0){
					hsp = new_hsp
				}
				else{
					hsp = 0	
				}
			}
		}
	#endregion
	
	#region //Air
		else{	
			if (hsp > 0){
				var new_hsp = hsp - air_fric
				if (new_hsp >= 0){
					hsp = new_hsp
				}
				else{
					hsp = 0	
				}
			}
			else if (hsp < 0){
				//hsp += air_fric	
	
				var new_hsp = hsp + air_fric
				if (new_hsp <= 0){
					hsp = new_hsp
				}
				else{
					hsp = 0	
				}
			}
		}
	#endregion
	
#endregion


#region //State Machine    (gmlive doesnt let me use switch with state variables)
	//var state_name = get_state_name(state)
	//var cur_state = string_delete(state_name, 1, 3);
	//sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))

	#region //Jump
		if (state == PS_JUMP){
			jump_timer ++
			

			if (state_timer == 2 && !jump_played){
				audio_play_sound(snd_jump, 0, false)	
				show_debug_message("played")
				jump_played = true
			}
			
			if (jump_timer >= 2){
				if (!keyboard_check_direct(ord("Z"))){ // minimum jump time
					//state = PS_FALLING
					//state_timer = 0
					////jump_timer = 0
					jump_done = true
					//image_speed = 1
				}

			}
			if (jump_timer >= 10){ //max jump time
				//state = PS_FALLING
				//state_timer = 0
				//jump_timer = 0
				jump_done = true
				//image_speed = 1
			}
			
			
			if (jump_done == false){
				vsp = jump_spd	
			}
			
			
		

		
			if (floor(image_index) = 1){
				//image_speed = 0	
			}
	
		}
		
	#endregion 
	
	
	#region //DoubleJump
		else if (state == PS_DOUBLEJUMP){
			jump_timer ++
			
			if (state_timer == 2 && !jump_played){
				audio_play_sound(snd_jump, 0, false)	
				show_debug_message("played")
				jump_played = true
			}
			
			if (jump_timer >= 2){
				if (!keyboard_check_direct(ord("Z"))){ // minimum jump time
					//state = PS_FALLING
					//state_timer = 0
					////jump_timer = 0
					jump_done = true
					//image_speed = 1
				}

			}
			if (jump_timer >= 10){ //max jump time
				//state = PS_FALLING
				//state_timer = 0
				//jump_timer = 0
				jump_done = true
				//image_speed = 1
			}
			
			
			if (jump_done == false){
				vsp = djump_spd	
			}
			
			

		
			if (floor(image_index) = 1){
				//image_speed = 0	
			}
		}	
	#endregion 
	

	#region //TripleJump
		else if (state == PS_TRIPLEJUMP){
			jump_timer ++
			
			if (state_timer == 2 && !jump_played){
				audio_play_sound(snd_jump, 0, false)	
				audio_play_sound(snd_triplejump, 1, false)	
				show_debug_message("played")
				jump_played = true
			}
			
			if (jump_timer >= 2){
				if (!keyboard_check_direct(ord("Z"))){ // minimum jump time
					//state = PS_FALLING
					//state_timer = 0
					////jump_timer = 0
					jump_done = true
					//image_speed = 1
				}

			}
			if (jump_timer >= 10){ //max jump time
				//state = PS_FALLING
				//state_timer = 0
				//jump_timer = 0
				jump_done = true
				//image_speed = 1
			}
			
			
			if (jump_done == false){
				vsp = tjump_spd	
			}
			
			

		}	
	#endregion 
	


	
	#region //Run
		else if (state == PS_RUN){
			if (!grounded){
				set_state(PS_FALLING)	
			}
			
			if (!keyboard_check_direct(vk_left) and !keyboard_check_direct(vk_right)){
				
				if (hsp > 2.5 or hsp < -2.5){
					runstop_timer += 1
					if (runstop_timer >= 3){
						runstop_timer = 0
						state = PS_RUNSTOP //potentaly change this to a run_stop or something
				
						image_index = 0
						state_timer = 0
						var state_name = get_state_name(state)
						var cur_state = string_delete(state_name, 1, 3);
						sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
				
						started_run = false
					}
				}
				else{
					state = PS_WALK //potentaly change this to a run_stop or something
				
					image_index = 0
					state_timer = 0
					var state_name = get_state_name(state)
					var cur_state = string_delete(state_name, 1, 3);
					sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
				}
			}
			
			#region //Right
				if (image_xscale == .5){
					if (hsp < max_hsp){
						

						hsp += (accel_speed * image_xscale)



					}
				}
			#endregion
			
			#region //Left
				else {
					if (hsp > -max_hsp){

						hsp += (accel_speed * image_xscale)

					}
				}
			#endregion
			
			
			//Step sfx
			if (floor(image_index) == 1 or floor(image_index) == 4){
				if (!step_played){
					step_snd = audio_play_sound(snd_step_new, 0, false)
					audio_sound_gain(step_snd, .2, 0)
					step_played = true
				}
			}
			else{
				step_played = false
			}
			
				
					
					
				
			
			
			
		}
	
	#endregion


	#region //Land
		else if (state == PS_LAND){
			if (state_timer == 1){
				audio_play_sound(snd_land, 0, false)	
			}
	
			jump_played = false	
			
			jump_done = false
			walljump_done = false
			walljump_speedtimer = 0
			jump_timer = 0		

			if (keyboard_check_direct(vk_right)){
				if (hsp < max_hsp){


					hsp += accel_speed / 2
				



				}
			}
			else if (keyboard_check_direct(vk_left) ){
				if (hsp > -max_hsp){
					

		
					hsp -= accel_speed / 2

				}
			}
			
			

			
		}
	#endregion

	#region //Walk
		else if (state == PS_WALK){
			if ((floor(hsp * 100) / 100 == 0.00 or floor(hsp * 100) / 100 == -0.00) or abs(hsp) == 0.00 or !grounded){
				state = PS_IDLE //potentaly change this to a run_stop or something
				
				image_index = 0
				state_timer = 0
				var state_name = get_state_name(state)
				var cur_state = string_delete(state_name, 1, 3);
				sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
			}
			
		}
	#endregion


	#region //WallJump
		else if (state == PS_WALLJUMP){
			if (state_timer = 1){
				walljump_activedir = walljump_dir
				if (walljump_activedir == 1){
						image_xscale = -.5	
						
						//hsp = -3
						//vsp = 5
					}
				else{
						image_xscale = .5	
						//hsp = 3
						//vsp = 5
				}
				
				
				walljump_done = false
				jump_played = false
				walljump_speedtimer = 0
			}
		
			if (state_timer == 2 && !jump_played){
				audio_play_sound(snd_jump, 0, false)	
				jump_played = true
			}
		
		
		
			walljump_speedtimer ++
			
			if (walljump_speedtimer >= 2){
				if (!keyboard_check_direct(ord("Z"))){ // minimum jump time
					//state = PS_FALLING
					//state_timer = 0
					////jump_timer = 0
					walljump_done  = true
					//image_speed = 1
				}

			}
			if (walljump_speedtimer >= 10){ //max jump time
				//state = PS_FALLING
				//state_timer = 0
				//jump_timer = 0
				walljump_done  = true
				//image_speed = 1
			}
			
			
			if (walljump_done  == false){
				vsp = walljump_vsp
				hsp = walljump_hsp * -walljump_activedir

			}
			
			

		


		
		}
	
	#endregion
	
	
	#region	//Death
		else if (state = PS_DEATH){
			if (state_timer = 1){
				vsp = 0
				hsp = 0
				can_move = false
				can_jump = false
				position_correction = false
				//obj_camera.following = false
				
				moveto_up = y - 32
				//moveto_end = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + sprite_height + 10
			}
			
			else if (state_timer > 20 && state_timer < 30){
				y = lerp(y, moveto_up, .2 + .05)
			
			}
			else if (state_timer > 30 && state_timer < 200){
				y += 6
				//find some actual ease function better than lerp later
			}	
		}
	
	
	#endregion


	#region //Win
		else if (state == PS_WIN){
			if (state_timer == 1){
				can_move = false
				can_jump = false
				sprite_index = spr_mario64_run
				max_hsp = 2.3
			}
			
			if (win_animl == true){
				if (hsp < max_hsp){
					image_xscale = .5
					hsp += (accel_speed * 1)
				}
			}
			else if (win_animr == true){
				if (hsp > -max_hsp){
					image_xscale = -.5
					hsp += (accel_speed * -1)
				}
			}		
		}
	
	#endregion

#endregion





if (!grounded && can_move){
	if (keyboard_check_direct(vk_right) && hsp < max_airspeed){

		hsp += air_accel	

	}
	
	if (keyboard_check_direct(vk_left) && hsp > -max_airspeed){

		hsp -= air_accel	

		
	}
	
	#region //WallJump Statechange
		if (walljump_timer > 0 && keyboard_check_pressed(ord("Z"))){
			state = PS_WALLJUMP
			
			walljump_timer = 0
			
			
			image_index = 0
			var state_name = get_state_name(state)
			var cur_state = string_delete(state_name, 1, 3);
			sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
			state_timer = 0
			
			/*		
			if (walljump_dir == "right"){
					image_xscale = -.5	
					
					hsp = -3
					vsp = 5
				}
			else{
					image_xscale = .5	
					hsp = 3
					vsp = 5
			}
			*/
		}
	
	
	#endregion
	
	
}
else{
	#region //Move left and right state change
		if (can_move && state != PS_JUMP && state != PS_DOUBLEJUMP && state != PS_TRIPLEJUMP && state != PS_LAND && state != PS_RUNTURN && keyboard_check_direct(vk_left)){
			if (image_xscale != -.5 && state == PS_RUN && abs(hsp) >= 1){
				state = PS_RUNTURN
				state_timer = 0
				image_index = 0
				image_xscale = -.5
				
				var state_name = get_state_name(state)
				var cur_state = string_delete(state_name, 1, 3);
				sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
		
			}
			else{
				state = PS_RUN
				image_xscale = -.5
	
				if (started_run == false){
					image_index = 0
					state_timer = 0
					started_run = true
				}
				//image_index = 0
				var state_name = get_state_name(state)
				var cur_state = string_delete(state_name, 1, 3);
				
				if (!win_animl and !win_animr){
					sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
				}
				else{
					//sprite_index = spr_mario64_run	
				}

			}
		}

		if (can_move && state != PS_JUMP && state != PS_DOUBLEJUMP && state != PS_TRIPLEJUMP && state != PS_LAND && state != PS_RUNTURN && keyboard_check_direct(vk_right)){
			if (image_xscale != .5 && state == PS_RUN && abs(hsp) >= 1){
				state = PS_RUNTURN
				state_timer = 0
				image_index = 0
				image_xscale = .5

				var state_name = get_state_name(state)
				var cur_state = string_delete(state_name, 1, 3);
				sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
		
			}
			else{
				state = PS_RUN
				image_xscale = .5
	
				if (started_run == false){
					image_index = 0
					state_timer = 0
					started_run = true
				}
				//image_index = 0
				var state_name = get_state_name(state)
				var cur_state = string_delete(state_name, 1, 3);
				sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
			}
		}
	#endregion
	
	#region //Check for object with an action below (intentionally not checking for grounded for now)
		if (keyboard_check_direct(vk_down)){		
			var collist = ds_list_create()

			instance_place_list(x, y + 1, all, collist, false)

				
				for (var i2 = 0; i2 < ds_list_size(collist); i2 ++){
					var obj = ds_list_find_value(collist, i2)
					

					if (variable_instance_exists(obj, "has_action") && obj.action_input == obj_action_inputs.press_down){
						with (obj){
							event_perform(ev_other, ev_user0)	

						}
					}
				}
			
				ds_list_destroy(collist)
				collist = -1
		
		}
		
		
		//variable_instance_exists(obj, "has_action") && obj.action_input == obj_action_inputs.jump_bump
	
	#endregion
	

	
	
	
	
	#region //Jump State-Change (single, double, triple)
		if (can_jump){
			if (keyboard_check_pressed(ord("Z")) or jumpbuffer_timer > 0){	
				if (cur_jump == 0){
					state = PS_JUMP
					cur_jump = 1
					multjump_var = true
					image_index = 0
					var state_name = get_state_name(state)
					var cur_state = string_delete(state_name, 1, 3);
					sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
					state_timer = 0
				}
		
				else if (cur_jump == 1 && multijump_timer > 0){
					state = PS_DOUBLEJUMP
					state_timer = 0
					cur_jump = 2
					multjump_var = true
					multijump_timer = 0
				
					image_index = 0
					var state_name = get_state_name(state)
					var cur_state = string_delete(state_name, 1, 3);
					sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
				}
			
				else if (cur_jump == 2 && multijump_timer > 0){
					if (abs(hsp) > 1.8){
						state = PS_TRIPLEJUMP
						state_timer = 0
						cur_jump = 3
						multjump_var = true
						multijump_timer = 0
						image_index = 0
						var state_name = get_state_name(state)
						var cur_state = string_delete(state_name, 1, 3);
						sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
					}
				}	
				else if (cur_jump == 3 && multijump_timer > 0){

					state = PS_JUMP
					cur_jump = 1
					multjump_var = true
					multijump_timer = 0
					image_index = 0
					var state_name = get_state_name(state)
					var cur_state = string_delete(state_name, 1, 3);
					sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
					state_timer = 0
				}
			}
		}
	#endregion
}



	#region //Check for collision with anything with an action anywhere on player	
		var collist = ds_list_create()

		instance_place_list(x, y, all, collist, false)

				
			for (var i2 = 0; i2 < ds_list_size(collist); i2 ++){
				var obj = ds_list_find_value(collist, i2)


				if (variable_instance_exists(obj, "has_action") && obj.action_input == obj_action_inputs.general_col){
					
					with (obj){
						event_perform(ev_other, ev_user0)	

					}
				}
			}
			
			ds_list_destroy(collist)
			collist = -1
		

		
		
	//variable_instance_exists(obj, "has_action") && obj.action_input == obj_action_inputs.jump_bump
	
	#endregion















#region //Collision / Gravity
	#region //Gravity
		if (grounded == false && state != PS_DEATH){
			var new_vsp = 0
			new_vsp = vsp - grav

			if (vsp > max_vsp * -1){
				vsp = new_vsp	
			}
			else{
				if (vsp > 0){
					//vsp = max_vsp
				}
				else{
					vsp = -max_vsp	
				}
			}
	
			for (var i = 0; i > new_vsp; i --){
				//var spr_left = position_meeting(x, (y + sprite_height) + floor(abs(i)), obj_collision)
				//var spr_mid = position_meeting(x + (sprite_width / 2), (y + sprite_height) + floor(abs(i)), obj_collision)
				//var spr_right = position_meeting(x + sprite_width, (y + sprite_height) + floor(abs(i)), obj_collision)
		
				//replace sprite_width with bbox
				var spr_left = position_meeting(bbox_left + 1, y + floor(abs(i)) , obj_collision)
				var spr_mid = position_meeting(x, y + floor(abs(i)) , obj_collision)
				var spr_right = position_meeting(bbox_right - 1, y  + floor(abs(i)) , obj_collision)		
		
				var spr_topright = position_meeting(bbox_right - 1, (y - (bbox_bottom - bbox_top)) + floor(abs(i)), obj_collision)	



		
				if (spr_left or spr_mid or spr_right){	//This checks if bottom left, right, and middle are touching a collision object
					grounded = true	
			
					state = PS_LAND
					multijump_timer = 8
					walljump_setup = false
					state_timer = 0
					image_index = 0

					var state_name = get_state_name(state)
					var cur_state = string_delete(state_name, 1, 3);
					sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
					
					//can_jump = true
					//can_jump = false
					image_speed = .8
			
					var col = spr_left or spr_mid or spr_right
					vsp = 0	
					y = floor(y + abs(i))
					//y = col.y 
					break
				}
			}
		}
		else if (!instance_place(x, y + 1, obj_collision) && state != PS_DEATH){
			grounded = false
			//state = PS_FALLING //remove later
			state_timer = 0

			
		}
	#endregion


	#region //HSp
			var new_hsp = hsp


	
			for (var i = 0; i < abs(new_hsp); i ++){

				var spr_right_bottom = position_meeting(bbox_right + i + 1, y - 1, obj_collision)
				var spr_right_mid = position_meeting(bbox_right + i + 1, y - (bbox_bottom - bbox_top), obj_collision)
				var spr_right_top = position_meeting(bbox_right + i + 1, bbox_top, obj_collision)	
		
				var spr_topright = position_meeting(bbox_right - 1, (y - (bbox_bottom - bbox_top)) + floor(abs(i)), obj_collision)	

				var placeL = instance_place(x - i - 1, y - 1, obj_collision)
				var placeR = instance_position(x + i + 1, y - 1, obj_collision)
				



				//if (instance_place(x - i - 1, y - 1, obj_collision)){
				if (place_meeting(x + new_hsp, floor(y), obj_collision)){
				//if (spr_right_mid or spr_right_bottom or spr_right_top){	//This checks if bottom left, right, and middle are touching a collision object
				
					var col = instance_place(x + new_hsp, floor(y), obj_collision)
					if (!grounded && old_hsp != 0 ){
						walljump_timer = 15


						if (col.x < x){	
							//left
							walljump_dir = -1
						}
						else{
							//right
							walljump_dir = 1
						}
					}
				

					hsp = 0	
					x = x + abs(i)
					break
				}
			}


	#endregion
	
	
	
		#region //Head
			var new_vsp = vsp
			


	
			for (var i = 0; i < new_vsp; i ++){
				//var spr_left = position_meeting(x, (y + sprite_height) + floor(abs(i)), obj_collision)
				//var spr_mid = position_meeting(x + (sprite_width / 2), (y + sprite_height) + floor(abs(i)), obj_collision)
				//var spr_right = position_meeting(x + sprite_width, (y + sprite_height) + floor(abs(i)), obj_collision)
		
				//replace sprite_width with bbox
				var spr_left = position_meeting(bbox_left + 1, bbox_top + floor(abs(i)), obj_collision)
				var spr_mid = position_meeting(x, bbox_top + floor(abs(i)), obj_collision)
				var spr_right = position_meeting(bbox_right - 1, bbox_top  + floor(abs(i)), obj_collision)		
		
				var spr_topright = position_meeting(bbox_right - 1, (y - (bbox_bottom - bbox_top)) + floor(abs(i)), obj_collision)	

				var collist = ds_list_create()
				var collidedwithtop = false
				instance_place_list(x, y - new_vsp, all, collist, false)

				
				//loop through found collisions (i can probably make this whole thing work better/different later but i just literaly forgot how do to it
				for (var i2 = 0; i2 < ds_list_size(collist); i2 ++){
					var obj = ds_list_find_value(collist, i2)
					
					if (!collidedwithtop && object_get_name(obj.object_index) == "obj_collision"){

						collidedwithtop = true
					}
					else if (variable_instance_exists(obj, "has_action") && obj.action_input == obj_action_inputs.jump_bump){

						with (obj){
							event_perform(ev_other, ev_user0)	
						}
					}
				}
				
				
				//if (place_meeting(x, y - new_vsp, obj_collision)){		//old (before bumping blocks for stuff to happen)
				if (collidedwithtop){		
						vsp = 0	
						jump_done = true
						//y = floor(y + abs(i)) + 3
						break
				}
				
				ds_list_destroy(collist)
				collist = -1
				
			}
		
	#endregion


	
	
	
	
	
x += hsp

if (position_correction && place_meeting(x, y , obj_collision)){
	var nearest = instance_place(x, y , obj_collision)
	var tempx = ((nearest).x)
	//var tempy = ((nearest).y)
	var tempvar1 = x - tempx
	//var tempvar2 = y - tempy
	x += sign(tempvar1)
	//y += sign(tempvar2)

	
}



#endregion







y -= floor(vsp)






old_hsp = hsp

if (keyboard_check_direct(ord("G"))){

}


//done here so i can just throw i in easly instead of going through every state change and doing it like that
if (!grounded && state == PS_IDLE){
	set_state(PS_FALLING)	
}

