/// @description Insert description here
// You can write your code in this editor

time ++
x += 5 * image_xscale

if (instance_place(x, y, obj_collision) && time > 20){
	instance_destroy()	
}