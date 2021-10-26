/// @description Insert description here
// You can write your code in this editor
//if (global.game_paused) exit;

if (following){
	
	if (win_cam){
		
		if (!movetowin){
			x = lerp(x , obj_plr.x + 200, .02);	

			y = lerp(y , obj_plr.y - 110, .02);


			if (floor(x) >  floor(obj_plr.x + 60)  && floor(x) < floor(obj_plr.x + 110)){
				movetowin = true	
			}
		}
		else{
			x = lerp(x , obj_plr.x + 90, .1);	

			y = lerp(y , obj_plr.y - 105, .1);
		}
		

		time ++
	}
	else{
		x = lerp(x, obj_plr.x, .1);	

		y = lerp(y, obj_plr.y, .1);
		winstartx = x
		winstarty = y
	}
}


///Paralax effect

var camx = camera_get_view_x(maincamera)
var xspd = 3

camx += xspd





if (room == rm_lvl1){
	layer_x("MountainsFront_BG", .2 * camx)	
	layer_x("MountainsBack_BG", .3 * camx)	
	layer_x("CloudsFront_BG", .7 * camx)	
}
	
	