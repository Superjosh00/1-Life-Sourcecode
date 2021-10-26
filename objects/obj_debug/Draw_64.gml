/// @description Insert description here
// You can write your code in this editor


draw_set_font(font0)
draw_set_color(c_white)


/*
draw_text(0, 0, "credits_timer: " + string(credits_timer))

/*

draw_text(0, 0, "FPS: " + string(fps))

draw_text(0, 20, "FPS_REAL: " + string(fps_real))

draw_text(0, 40, "state_timer: " + string(obj_plr.state_timer))

draw_text(0, 60, "image_index: " + string(obj_plr.image_index))

draw_text(0, 80, "vsp: " + string(floor(obj_plr.vsp)))

draw_text(0, 100, "hsp: " + string(obj_plr.hsp))

draw_text(0, 120, "state: " + string(get_state_name(obj_plr.state)))

draw_text(0, 140, "can_jump: " + string(obj_plr.can_jump))

draw_text(0, 160, "x: " + string(obj_plr.x))

draw_text(0, 180, "y: " + string(obj_plr.y))

draw_text(0, 240, "mousey: " + string(mouse_y))

draw_text(0, 260, "multijump_timer: " + string(obj_plr.multijump_timer))

draw_text(0, 280, "finish_lvl_startx: " + string(finish_lvl_startx))

draw_text(0, 300, "finish_lvl_timer: " + string(finish_lvl_timer))

draw_text(0, 320, "kill_plr_timer: " + string(kill_plr_timer))

with (obj_plr){
	var near = instance_nearest(x, y, obj_collision)
	
	draw_text(0, 200, "near_x: " + string(near.x))
	draw_text(0, 220, "closest_x(mine): " + string(x - near.x))
	//draw_text(0, 220, "spr_right: " + string(x - near.x))
}


//lengthdir_x()



