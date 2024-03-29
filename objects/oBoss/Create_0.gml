

enum BOSSSTATE {
	IDLE,
	SHOCKWAVE,
	LASER,
	GUN,
	FINGER,
	CRUSH,
	DEAD
}

state = BOSSSTATE.IDLE;

pulse = 0;
targetAngle = 0;

scale = 1;
angle = 1;

damaged = false;
damagedAmount = 0;
damageTimer = 0;
flashing = 0;

closed = false;

xOffset = sprite_xoffset;
yOffset = sprite_yoffset;
offsetDist = point_distance(0,0,sprite_xoffset,sprite_yoffset);
offsetDir = point_direction(0,0,sprite_xoffset,sprite_yoffset);
gunSide = 0;
gunKnockback = 0;
gunDir = 0;
gunAmount = 0;

laser = noone;
laserDir = 0;

surface = surface_create(sprite_width, sprite_height);

uFlash = shader_get_uniform(shWhite, "percent");

movespd = 16;

playerDir = 0;
chargeWindup = 0;
collided = false;
timer = 0;

idleX = 0;
idleY = 0;
idleWait = 0;
idleDirection = 0;

eyeClosed = false;

lastAttack = -1;
attackWait = 60 * 3;

maxHP = 10;
hp = maxHP;
dead = false;
deadTimer = 0;
explosionCount = 0;

fx = layer_get_fx("Greyscale");
fx_set_parameter(fx,"g_Intensity",0);

