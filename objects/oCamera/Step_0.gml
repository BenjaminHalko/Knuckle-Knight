/// @desc Shake Camera

if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
	
	xTo = clamp(xTo,viewWidthHalf,room_width-viewWidthHalf);
	yTo = min(yTo,room_height-viewHeightHalf);
}

//Update Object Position
x += (xTo - x) / 12;
y += (yTo - y) / 12;

camera_set_view_pos(cam,x-viewWidthHalf+random_range(-shakeRemain,shakeRemain),y-viewHeightHalf+random_range(-shakeRemain,shakeRemain));
shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

