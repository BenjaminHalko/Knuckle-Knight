/// @desc Movement

EnableLive;

Input();

#region Movement
var _move = keyRight - keyLeft;
if (dashing <= 0) {
	// Horizontal
	hsp = Approach(hsp,0,fric);
	if (_move != 0)
		facing = sign(_move);
	if knockback != 0 {
		knockback = Approach(knockback, maxwalk*sign(knockback),0.01);
		hsp = knockback;
		keyLeft = 0;
		keyRight = 0;
	} else hsp = median(-maxwalk,maxwalk,hsp+(keyRight - keyLeft)*walkspd);

	// Vertical
	vsp += grv;
	vsp = min(vsp, maxvspd);
}

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
if (platform != noone and !instance_exists(platform))
	platform = noone;
if platform != noone and platform.bbox_bottom < room_height and platform.bbox_top > INFO_HEIGHT {
	y = platform.bbox_top;
}

// Dash
if (dashing <= 0 and canDash and keyJump and canJump < 0) {
	if (!keyLeft and !keyRight and !keyUp and !keyDown)
		dashDirection = 180 * (facing == -1);	
	else
		dashDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
	dashing = dashAmount;
	canDash = false;
	ScreenShake(10, 10);
	repeat(20) {
		CreateParticle(x,y,oParticle,random(360),10,random_range(0.05,0.1),random_range(0.1,5),180+dashDirection+random_range(-100,100));	
	}
	image_angle = 360*((dashDirection+90) % 360 >= 90);
	dashInControl = true;
}
if (dashing > 0) {
	if (dashInControl) {
		var _amount = lerp(dashSpdStart, dashSpdEnd, animcurve_channel_evaluate(dashCurve, 1 - dashing / dashAmount));
		hsp = lengthdir_x(_amount, dashDirection);
		vsp = lengthdir_y(_amount, dashDirection);
	}
	dashing--;
	if (dashing == 0) {
		vsp = max(jumpspd/2,vsp);	
	}
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
platform = collision_line(bbox_left,y+sign(vsp_final),bbox_left+hsp_final,y+vsp_final+1,oPlatform,false,false);
if platform == noone
	platform = collision_line(bbox_right,y+sign(vsp_final),bbox_right+hsp_final,y+vsp_final+1,oPlatform,false,false);
x += hsp_final;

if platform != noone and (y <= platform.bbox_top or vsp >= 0) {
	y = platform.bbox_top;
	vsp_final = 0;
	vsp = 0;
	knockback = 0;
	canJump = jump_buffer;
	canDash = true;
	//if (_landed)
		//audio_play_sound(snLand,1,false);
}

y += vsp_final;
#endregion

// Clamp Values
x = clamp(x,4,room_width-4);

if (y >= room_height) {
	vsp = jumpspd * 1.8;
	knockback = 0;
}

if (invincibility <= 0) {
	image_alpha = 1;
} else {
	invincibility--;
	image_alpha = Wave(0.2,0.95,0.1,0);	
}
	
// Animation
image_xscale = facing;
if (dashing > 0) {
	mask_index = sPlayerDash;	
	sprite_index = sPlayerDash;
	image_angle = dashDirection+90;	
	if (dashing % 2 == 0) {
		with(instance_create_depth(x,y,depth+1,oAfterImage)) {
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			image_angle = other.image_angle;
			image_xscale = other.image_xscale;
			image_blend = c_aqua;
		}
	}
} else {
	image_angle = ApproachFade(image_angle,360*((dashDirection) % 360 > 90),50,0.8);
	mask_index = sPlayerIdle;
	if (knockback != 0) {
		sprite_index = sPlayerHurt;
	} else if (platform != noone) {
		if (_move == 0) {
			sprite_index = sPlayerIdle;	
		} else {
			sprite_index = sPlayerRun;	
		}
	} else {
		if (sprite_index != sPlayerJump and sprite_index != sPlayerAir) {
			if (vsp < 0) {
				sprite_index = sPlayerJump;
				image_index = 0;
			} else {
				sprite_index = sPlayerAir;
			}
		}
	}
}