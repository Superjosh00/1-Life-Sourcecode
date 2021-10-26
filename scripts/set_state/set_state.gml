///@arg1 State
if (object_get_name(object_index) == "obj_plr"){
	//show_debug_message(object_get_name(object_index))
	state = argument0
	image_index = 0
	var state_name = get_state_name(state)
	var cur_state = string_delete(state_name, 1, 3);
	sprite_index = asset_get_index("spr_mario64_" + string_lower(cur_state))
	state_timer = 0	
}