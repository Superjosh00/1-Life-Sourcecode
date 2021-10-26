/// @description Insert description here
// You can write your code in this editor



if (!new_room){
	if (image_alpha != 1){
		
		image_alpha += 0.05
	}
	
}
else{
	wait_timer ++
	if (wait_timer > 25){
		if (image_alpha != 0){
		
			image_alpha -= 0.05
		}	
		else{
			instance_destroy()	
			
		}
	}
}


