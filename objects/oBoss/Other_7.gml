/// @desc 

if (sprite_index == sBossFist) {
	if (image_speed == 1) {
		image_speed = 0;
		image_index = 3;
	} else {
		image_speed = 1;
		sprite_index = sBoss;
	}
}