/// @desc

EnableLive;

if (keyboard_check_pressed(ord("U"))) state = BOSSSTATE.SHOCKWAVE;

var _playerDir = point_direction(x,y,oPlayer.x,oPlayer.y-16);
var _targetAngle = 0;
var _fullyClosed = (sprite_index == sBossFist and image_index == 3);
// Switch
switch (state) {
	default: {
		closed = false;
		if (!damaged) {
			if (global.audioTick) {
				pulse = 1;	
			}
			_targetAngle = 10*(1 - (global.audioBeat % 2 == 0)*2);
		}
		xstart = x;
		ystart = y;
	} break;
	case BOSSSTATE.SHOCKWAVE: {
		closed = true;
		_targetAngle = _playerDir;
		if (image_index >= 1) {
			chargeWindup = ApproachFade(chargeWindup, 1, 0.1, 0.8);	
		}
		x = xstart - lengthdir_x(chargeWindup*20, _playerDir);
		y = ystart - lengthdir_y(chargeWindup*20, _playerDir);
	} break;
}

// Damaged
if (!closed) {
	if (point_in_circle(oPlayer.x,oPlayer.y,x,y,110)) {
		if (oPlayer.dashing > 0) {
			oPlayer.dashing = 2;
			oPlayer.dashInControl = false;
			oPlayer.dashDirection = ApproachCircleEase(oPlayer.dashDirection,point_direction(oPlayer.x+lengthdir_x(20,oPlayer.dashDirection+180),oPlayer.y+lengthdir_y(20,oPlayer.dashDirection+180),x,y),20,0.7);
			oPlayer.hsp = lengthdir_x(14,oPlayer.dashDirection);
			oPlayer.vsp = lengthdir_y(14,oPlayer.dashDirection);
			
		
			if (point_distance(oPlayer.x+lengthdir_x(20,oPlayer.dashDirection+180),oPlayer.y+lengthdir_y(20,oPlayer.dashDirection+180),x,y) < 30) {
				HurtPlayer(oPlayer.id, false);
				oPlayer.knockback = sign((oPlayer.dashDirection+90) % 360 >= 180) * oPlayer.maxwalk * 1.5;
				damaged = true;
				damageTimer = 60;
			}
		}
	}
}

// Animate
pulse = ApproachFade(pulse,0,0.05,0.8);
scale = pulse*0.4 + 1 + damagedAmount * 0.2;
if (sprite_index == sBossFist) _targetAngle -= 80;
angle = ApproachCircleEase(angle,_targetAngle,50,0.7);
damagedAmount = Approach(damagedAmount, damaged, 0.4);
if (damaged) {
	flashing = !flashing;
	if (--damageTimer <= 0)
		damaged = false;
}
if (closed) {
	if (sprite_index != sBossFist) {
		sprite_index = sBossFist;
		image_index = 0;
	}
} else {
	sprite_index = sBoss;	
}

if (!surface_exists(surface)) surface = surface_create(sprite_width, sprite_height);