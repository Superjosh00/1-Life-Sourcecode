/// @description Insert description here
// You can write your code in this editor





grounded = true

assign_states() //Assigns a list of state variables with numbers so i can use states similar to rivals gml
state = PS_IDLE
state_timer = 0

grav = .3

air_fric = 0//.2
air_accel = 0.1//.3


ground_fric = .2
accel_speed = .6
jump_timer = 0

started_run = false

jump_spd = 3.3
djump_spd = 4.3
tjump_spd = 6

jump_done = false

//top_fallspeed = 5

max_vsp = 6
max_hsp = 3.1
max_airspeed = max_hsp
vsp = 0
hsp = 0
old_hsp = 0

//used to check if an animation has finished looping once
anim_loop = false

can_move = true
can_jump = true
can_run = true

runstop_timer = 0

multjump_var = false
multijump_timer = 0
cur_jump = 0

walljump_timer = 0
walljump_setup = false
//left, right
walljump_dir = 0
walljump_activedir = 0
walljump_hsp = 3
walljump_vsp = 4
walljump_done = false
walljump_speedtimer = 0


jumploop = false
jumpbuffer_timer = 0

//incase i want like some object to manipulate position frame by frame
position_correction = true

///REMOVE THIS WHOLE FUNCTION LATER
checkpointx = x
checkpointy = y



win_animl = false
win_animr = false

step_played = false
step_snd = 0

jump_played = false