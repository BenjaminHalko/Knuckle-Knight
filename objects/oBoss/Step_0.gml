/// @desc

EnableLive;

if (keyboard_check_pressed(ord("U"))) state = BOSSSTATE.SHOCKWAVE;
if (keyboard_check_pressed(ord("Y"))) state = BOSSSTATE.LASER;

var _playerDir = point_direction(x,y,oPlayer.x,oPlayer.y-16);
var _targetAngle = 0;
var _fullyClosed = (sprite_index == sBossFist and image_index == 3);
// Switch
switch (state) {
	default: {
		closed = false;
		if (sprite_index == sBoss) {
			if (!damaged) {
				if (global.audioTick) {
					pulse = 1;	
				}
				_targetAngle = 10*(1 - (global.audioBeat % 2 == 0)*2);
			}
		
			xstart = x;
			ystart = y;
		
			if (!damaged) {
				idleWait--;
				if (idleWait <= 0 or point_distance(x,y,idleX,idleY) < 100) {
					var _dir = _playerDir+180+random_range(-20,20);
					var _len = random_range(20,100);
					idleX = oCamera.x+lengthdir_x(_len*2,_dir);
					idleY = oCamera.y+lengthdir_y(_len*0.8,_dir);
					idleWait = 30;
					idleWait = 30;
				}
				var _spd = lerp(3,2,median(max(0,point_distance(x,y,oPlayer.x,oPlayer.y)-80)/120,0,1));
				idleDirection = ApproachCircleEase(idleDirection,point_direction(x,y,idleX,idleY),2,0.1);
				x += lengthdir_x(_spd,idleDirection);
				y += lengthdir_y(_spd,idleDirection);
			}
		}
	} break;
	case BOSSSTATE.SHOCKWAVE: {
		closed = true;
		if (image_index >= 1) {
			chargeWindup = ApproachFade(chargeWindup, 1, 0.05, 0.8);	
		}
		if (chargeWindup < 0.99) {
			x = xstart - lengthdir_x(chargeWindup*32, _playerDir);
			y = ystart - lengthdir_y(chargeWindup*32, _playerDir);
			playerDir = _playerDir;
			collided = false;
			
		} else if (!collided) {
			x += lengthdir_x(32, playerDir);
			y += lengthdir_y(32, playerDir);
			x = clamp(x,10,room_width-10);
			y = min(y,room_height-10);
			with(instance_create_depth(x,y,depth+1,oAfterImage)) {
				sprite_index = other.sprite_index;
				image_index = other.image_index;
				image_angle = other.angle;
				image_blend = c_red;
			}
			var _collision = (collision_line(x,y,x+lengthdir_x(32, playerDir),y+lengthdir_y(32,playerDir),oPlatform,true,false) != noone);
			var _boundsCollision = (x == room_width-10 or y == room_height-10 or x == 10);
			if (_collision or _boundsCollision) {
				if (_collision) {
					while(!place_meeting(x+lengthdir_x(1, playerDir),y+lengthdir_y(1, playerDir),oPlatform)) {
						x += lengthdir_x(1, playerDir);
						y += lengthdir_y(1, playerDir);
					}
				}
				collided = true;
				ScreenShake(60,10);
				timer = 30;
			}
		} else {
			if (--timer <= 0) {
				state = BOSSSTATE.IDLE;
				chargeWindup = 0;
			}
		}
		_targetAngle = playerDir;
	} break;
	case BOSSSTATE.LASER: {
		moveToPoint(room_width/2,room_height/4);
		
		if (x == room_width/2 and y == room_height/4) {
			
			if (--timer <= 0) {
				
				if (!instance_exists(oLaser)) {
					instance_create_depth(x,y,depth-1,oLaser);
					//oLaser.image_xscale = 0;
				} else if (oLaser.image_xscale == 20) {
					oLaser.image_angle = ApproachFade(oLaser.image_angle,-180,5,0.8);
					if (oLaser.image_angle <= -180 + 0.01) {
					instance_destroy(oLaser);
					state = BOSSSTATE.IDLE;
				}
				}
				
			}
		} else {
			timer = 30;	
		}
	} break;
}

// Damaged
if (!closed) {
	if (point_in_circle(oPlayer.x,oPlayer.y,x,y,40)) {
		if (oPlayer.dashing > 0) {
			if (oPlayer.dashMaxCurve == -1) {
				oPlayer.dashMaxCurve = 20;
				oPlayer.dashing = 20;
			}
			oPlayer.dashInControl = false;
			oPlayer.dashMaxCurve += 0.1;
			oPlayer.dashDirection = ApproachCircleEase(oPlayer.dashDirection,point_direction(oPlayer.x+lengthdir_x(20,oPlayer.dashDirection+180),oPlayer.y+lengthdir_y(20,oPlayer.dashDirection+180),x,y),oPlayer.dashMaxCurve,0.5);
			oPlayer.hsp = lengthdir_x(14,oPlayer.dashDirection);
			oPlayer.vsp = lengthdir_y(14,oPlayer.dashDirection);
			
		
			if (point_distance(oPlayer.x+lengthdir_x(20,oPlayer.dashDirection+180),oPlayer.y+lengthdir_y(20,oPlayer.dashDirection+180),x,y) < 30) {
				HurtPlayer(oPlayer.id, false);
				oPlayer.knockback = sign((oPlayer.dashDirection+90) % 360 >= 180) * oPlayer.maxwalk * 1.5;
				damaged = true;
				damageTimer = 60;
				oPlayer.dashing = 0;
				oPlayer.dashMaxCurve = -1;
				oPlayer.angle = 0;
			}
		}
	} else {
		oPlayer.dashMaxCurve = -1;	
	}
}

if (state != BOSSSTATE.IDLE and !damaged and !oPlayer.dashing) {
	if (place_meeting(x,y,oPlayer)) {
		HurtPlayer(oPlayer.id);	
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
	if (sprite_index == sBossFist) {
		image_speed = -1;	
	}
}

if (!surface_exists(surface)) surface = surface_create(sprite_width, sprite_height);