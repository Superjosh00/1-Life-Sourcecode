/// @description Insert description here
// You can write your code in this editor


//draw_sprite(sprite_index, 0, drawx, y)
draw_sprite_ext(sprite_index, 0, drawx, y, image_xscale, image_yscale, 0, c_white, image_alpha)

if (movingsprite){
	if (time != duration){
		drawx = EaseLinear(time, duration, startx, startx - 20, true)
		
		time ++
	}
	else if (instance_place(x, y, obj_plr)){
		obj_debug.kill_plr = true
		obj_debug.kill_plr_statechange = true
	}
}






