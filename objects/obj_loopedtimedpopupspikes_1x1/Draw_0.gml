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
	else{
		if (instance_place(x, y, obj_plr)){
			obj_debug.kill_plr = true
			obj_debug.kill_plr_statechange = true
		}
		if (retreat_timer < 120){
			retreat_timer ++
		}
		else{
			
			if (time2 != duration2){
				drawy = EaseLinear(time2, duration2, starty - 20, starty, true)
		
				time2 ++
			}
			else{
				activated = false

				movingsprite = false


				drawy = y + 16

				starty = drawy
				duration = 5;
				time = 0;

				duration2 = 5;
				time2 = 0;

				retreat_timer = 0

				start_timer = 0
			
			
			
			
			}
			
			
			
			
		}
	}
}






