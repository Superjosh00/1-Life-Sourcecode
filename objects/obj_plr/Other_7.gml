/// @description Insert description here
// You can write your code in this editor


if (state == PS_LAND){
	state = PS_IDLE	
	state_timer = 0
	
	//cur_jump = 0
	image_index = 0
	var state_name = get_state_name(state)
	var cur_state = string_delete(state_name, 1, 3);
	sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
	
}

else if (state == PS_JUMP){
	state = PS_FALLING
	state_timer = 0
	jump_done = false
	
	image_index = 0
	var state_name = get_state_name(state)
	var cur_state = string_delete(state_name, 1, 3);
	sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
}

else if (state == PS_RUNSTOP){
	state = PS_IDLE
	state_timer = 0
	
	
	image_index = 0
	var state_name = get_state_name(state)
	var cur_state = string_delete(state_name, 1, 3);
	sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
}

else if (state == PS_RUNTURN){
	state = PS_RUN
	state_timer = 0
	
	
	image_index = 0
	var state_name = get_state_name(state)
	var cur_state = string_delete(state_name, 1, 3);
	sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
}

else if (state == PS_DOUBLEJUMP){
	state = PS_FALLING
	state_timer = 0
	jump_done = false
	can_move = true
	
	image_index = 0
	var state_name = get_state_name(state)
	var cur_state = string_delete(state_name, 1, 3);
	sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
}

else if (state == PS_TRIPLEJUMP){
	state = PS_FALLING
	state_timer = 0
	jump_done = false
	can_move = true
	
	image_index = 0
	var state_name = get_state_name(state)
	var cur_state = string_delete(state_name, 1, 3);
	sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
}


else if (state == PS_WALLJUMP){
	state = PS_FALLING
	state_timer = 0
	
	walljump_setup = false
	image_index = 0
	var state_name = get_state_name(state)
	var cur_state = string_delete(state_name, 1, 3);
	sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
}




