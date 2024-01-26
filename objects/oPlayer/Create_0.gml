/// @desc Initialize Player

EnableLive;

// Movement Constants
grv = 0.8;
fric = 0.3;
walkspd = 0.6;
maxwalk = 3.8;
jumpspd = -12;
maxvspd = 12;
jump_buffer = 10;
dashSpdStart = 16;
dashSpdEnd = 4;
dashAmount = 10;

// Movement
hsp = 0;
vsp = 0;
hsp_f = 0;
vsp_f = 0;
hsp_final = 0;
vsp_final = 0;

dashDirection = 0;
dashing = 0;
dashInControl = true;

canJump = 0;
canDash = false;
jumpTimer = 0;

facing = 1;

platform = noone;

knockback = 0;

invincibility = 0;
hp = MAXHEALTH;

dashCurve = animcurve_get_channel(PlayerCurves, "dash");