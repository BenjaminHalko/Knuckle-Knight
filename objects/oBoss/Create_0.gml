EnableLive;

enum BOSSSTATE {
	IDLE,
}

state = BOSSSTATE.IDLE;

pulse = 0;
targetAngle = 0;

scale = 1;
angle = 1;

offsetDist = point_distance(0,0,sprite_xoffset,sprite_yoffset);
offsetDir = point_direction(0,0,sprite_xoffset,sprite_yoffset);

surface = surface_create(sprite_width, sprite_height);