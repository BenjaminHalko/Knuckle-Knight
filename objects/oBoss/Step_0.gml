/// @desc


// Animate
pulse = ApproachFade(pulse,0,0.1,0.8);
if (global.audioTick) {
	pulse = 1;	
}

image_xscale = pulse + 1;
image_yscale = image_xscale;