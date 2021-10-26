/// @description Insert description here
// You can write your code in this editor

instance_create_layer(x, y, "Collision", obj_collision)


if (instance_find(obj_demolvl_questionblock, 0).id != id){
	otherblock = instance_find(obj_demolvl_questionblock, 0)
	
	instance_deactivate_layer("Collision_hidden")
	layer_set_visible("Ground_hidden", false)
	//layer_set_visible("Mariomisc_hidden", false)

}
else{
	otherblock = instance_find(obj_demolvl_questionblock, 1)	
}

has_action = true
action_input = obj_action_inputs.jump_bump

activated = false


