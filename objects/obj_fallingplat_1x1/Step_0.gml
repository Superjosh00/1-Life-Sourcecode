/// @description Insert description here
// You can write your code in this editor


var newy = 0
var newy2 = 0

var newplry = y
if (!falling && instance_place(x , y - 1, obj_plr)){
	falling = true	
	fall_starty = y
}

if (falling){


	//y += 2
	
	
	
	
	if (time<duration) {
		//  time = 0;
		newy = abs(y - EaseInCubic(time, duration, fall_starty, fall_starty + 100, true))
	  
	  	if (instance_place(x , y - 1, obj_plr)){
			obj_plr.y += newy

		}
	  
		y = EaseInCubic(time, duration, fall_starty, fall_starty + 100, true)
	  
	 	  
	  collision.y += newy
	  
	  	if (instance_place(x, y - 1, obj_plr)){
		//obj_plr.y += newy
		
		}
		
	  fall_starty2 = y
	  time++;
	}
	else{
		

		
		if (time2<duration2) {
		  //  time = 0;  
			newy2 = abs(y - EaseLinear(time2, duration2, fall_starty2, fall_starty2 + 500, true))
		
			if (instance_place(x , y - 1, obj_plr)){
				obj_plr.y += newy2

			}

		
			y = EaseLinear(time2, duration2, fall_starty2, fall_starty2 + 500, true)
		  
		  
		  
			collision.y += newy2
			time2++;
		}
		else{
			deletetimer ++
			if (deletetimer == 20){
				instance_create_layer(x, fall_starty, layer, obj_fallingplat_1x1)
				instance_destroy(collision.id)
				instance_destroy()
			}
		}
		
		
	}
	

	
}