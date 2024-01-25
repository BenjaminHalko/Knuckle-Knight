/// @desc Initialize Platform

yPos = y;
activePercent = 0;
active = false;

if (!layer_get_visible(layer)) instance_destroy();