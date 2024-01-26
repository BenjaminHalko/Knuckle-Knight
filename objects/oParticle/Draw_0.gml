/// @desc 

draw_set_color(image_blend);
var _len = size * percent;
draw_triangle(
	x + lengthdir_x(_len, image_angle), y + lengthdir_y(_len, image_angle),
	x + lengthdir_x(_len, image_angle+120), y + lengthdir_y(_len, image_angle+120),
	x + lengthdir_x(_len, image_angle+240), y + lengthdir_y(_len, image_angle+240),
false);