/// @desc

EnableLive;

// Animate
pulse = ApproachFade(pulse,0,0.05,0.8);
if (global.audioTick) {
	pulse = 1;	
}

scale = pulse*0.4 + 1;
angle = ApproachFade(angle,10*(1 - (global.audioBeat % 2 == 0)*2),50,0.7);

if (!surface_exists(surface)) surface = surface_create(sprite_width, sprite_height);