/// @desc Movement

EnableLive;

Input();

#region Movement
// Horizontal
hsp = Approach(hsp,0,fric);
if knockback != 0 {
	hsp = median(-maxwalk,maxwalk,hsp+sign(knockback)*8);
	keyLeft = 0;
	keyRight = 0;
} else hsp = median(-maxwalk,maxwalk,hsp+(keyRight - keyLeft)*walkspd);

// Vertical
vsp += grv;
if(keyJump)
	jumpTimer = jump_buffer;
	
if(canJump-- > 0 and jumpTimer > 0) {
	vsp = jumpspd;
	canJump = 0;
	jumpTimer = 0;
	//audio_play_sound(snJump,1,false);
}
jumpTimer--;

// Moving Platform
if platform != noone and platform.bbox_bottom < room_height and platform.bbox_top > INFO_HEIGHT {
	y = platform.bbox_top;
}

// Set Speeds
hsp_final = hsp + hsp_f;
hsp_f = hsp_final - floor(abs(hsp_final))*sign(hsp_final);
hsp_final -= hsp_f;
 
vsp_final = vsp + vsp_f;
vsp_f = vsp_final - floor(abs(vsp_final))*sign(vsp_final);
vsp_final -= vsp_f;
#endregion

#region Collision
var _landed = platform == noone;
platform = collision_line(bbox_left,y+sign(vsp_final),bbox_left+hsp_final,y+vsp_final,oPlatform,false,false);
if platform == noone
	platform = collision_line(bbox_right,y+sign(vsp_final),bbox_right+hsp_final,y+vsp_final,oPlatform,false,false);
if noPlatform > 0 {
	platform = noone;
	noPlatform--;
}
x += hsp_final;

if platform != noone and (y <= platform.bbox_top or (vsp > 0 and noPlatform <= 0)) {
	y = platform.bbox_top;
	vsp_final = 0;
	vsp = 0;
	knockback = 0;
	canJump = jump_buffer;
	//if (_landed)
		//audio_play_sound(snLand,1,false);
} else platform = noone;

y += vsp_final;
#endregion

// Clamp Values
x = clamp(x,4,room_width-4);
y = clamp(y,INFO_HEIGHT+8,room_height);

if (y == room_height)
	vsp = jumpspd;