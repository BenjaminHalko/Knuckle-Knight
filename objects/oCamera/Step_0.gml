/// @desc Shake Camera

camera_set_view_pos(cam,random_range(-shakeRemain,shakeRemain),random_range(-shakeRemain,shakeRemain));
shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));