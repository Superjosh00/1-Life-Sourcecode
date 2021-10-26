/// @description Insert description here
// You can write your code in this editor


draw_sprite(sprite_index, 0, drawx, drawy)


if (activated){
	if (start_timer = 10){
		movingsprite = true
	}
	else{
		start_timer ++
	}	
}

if (movingsprite){
	if (time != duration){
		drawy = EaseLinear(time, duration, starty, starty - 20, true)
		
		time ++
	}
	else if (instance_place(x, y, obj_plr)){
		obj_debug.kill_plr = true
		obj_debug.kill_plr_statechange = true
	}
}






