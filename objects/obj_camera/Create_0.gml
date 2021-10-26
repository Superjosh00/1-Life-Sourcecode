
following = true
win_cam = false
x = obj_plr.x
y = obj_plr.y

bg_map = ds_map_create()

bg_map[? layer_background_get_id("MountainsFront_BG")] = 5


mountfront = layer_background_get_id("MountainsFront_BG")
mountfront = layer_background_get_id(mountfront)
mountfront_startx = layer_get_x("MountainsFront_BG")

//width = 480
//height = 270

width = 640
height = 360


maincamera = camera_create_view(x, y, width, height, 0, self, -1, -1, width / 2, height / 2,); 

view_camera[0] = maincamera;




duration = 40;
time = 0;

movetowin = false
winstarty = 0



