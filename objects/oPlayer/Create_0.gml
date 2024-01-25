/// @desc Initialize Player

EnableLive;

// Movement Constants
grv = 0.8;
fric = 0.3;
walkspd = 0.6;
maxwalk = 3;
jumpspd = -10;
jump_buffer = 10;

// Movement
hsp = 0;
vsp = 0;
hsp_f = 0;
vsp_f = 0;
hsp_final = 0;
vsp_final = 0;

canJump = 0;
jumpTimer = 0;

platform = noone;

knockback = 0;

hp = MAXHEALTH;
noPlatform = 0;