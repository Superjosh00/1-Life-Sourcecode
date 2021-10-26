/// @description Insert description here
// You can write your code in this editor



if (startup_canceltimer > 0){
	startup_canceltimer --	
	
}

if (startup_canceltimer == 0){
	startup_timer = 0	
}



if (activated){
	//gms is being jank with numnbers (showing 1 thing in draw but it aparently being different, also refusing to work when it should)
	if (round2dec(obj_plr.x) = x + (sprite_width / 2) or round2dec(obj_plr.x) = x + (sprite_width / 2) - 0.01){
		posx_moved = true
	}
	else{
		obj_plr.x = lerp(obj_plr.x, x + (sprite_width / 2), .1)

	}
	
	if (posx_moved){
		obj_plr.x = (x + (sprite_width / 2))
		event_timer ++
	
		if (event_timer < 64){
			obj_plr.y += 1
		}
		else if (event_timer == 66){
			obj_debug.kill_plr = true
			//obj_debug.kill_plr_statechange = true	
		}
		
		
	}
	
	
}