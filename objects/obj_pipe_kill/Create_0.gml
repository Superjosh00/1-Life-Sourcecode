/// @description Insert description here
// You can write your code in this editor


var col = instance_create_layer(x, y, "Collision", obj_collision)

col.image_xscale = 2
col.image_yscale = 4

has_action = true

action_input = obj_action_inputs.press_down


startup_canceltimer = 0
startup_timer = 0

posx_moved = false
event_timer = 0


activated = false