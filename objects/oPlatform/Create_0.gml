/// @desc Initialize Platform

yPos = y;
activePercent = 0;
active = false;
waveOffset = random(1);

if (!layer_get_visible(layer)) instance_destroy();