/// @description Insert description here
// You can write your code in this editor



if (!activated){
	sprite_index = spr_custom_hitblock

	activated = true
	

	
	if (otherblock.activated){
		instance_activate_layer("collision_hidden")	
		layer_set_visible("Ground_hidden", true)
		layer_set_visible("Mariomisc_hidden", true)
		//layers_reactivated = true

		var ar = instance_create_layer(2861, 883, "BehindGround_Instances", obj_arrow)
		ar.image_xscale = -1
		var ar = instance_create_layer(2891, 867, "BehindGround_Instances", obj_arrow)
		ar.image_xscale = -1
		var ar = instance_create_layer(2923, 851, "BehindGround_Instances", obj_arrow)
		ar.image_xscale = -1

	}
	
}




