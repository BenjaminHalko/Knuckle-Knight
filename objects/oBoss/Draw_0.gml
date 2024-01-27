/// @desc

EnableLive;

if (sprite_index == sBoss or sprite_index == sBossFist) {
	surface_set_target(surface);
	draw_clear_alpha(c_black,0);
	draw_sprite(sprite_index,image_index,xOffset,yOffset);
	if (sprite_index == sBoss or image_index < 2) {
		draw_sprite(sBossEye,2,xOffset,yOffset);
		var _dir = point_direction(x,y,oPlayer.x,oPlayer.y-16)-angle;
		var _len = min(5, point_distance(x,y,oPlayer.x,oPlayer.y-16));
		draw_sprite(sBossEye,0,xOffset+lengthdir_x(_len, _dir)*(1-damagedAmount), yOffset+lengthdir_y(_len*0.7, _dir)*(1-damagedAmount));
		draw_sprite(sBossEye,1,xOffset,yOffset);
	}
	surface_reset_target();

	draw_surface_ext(surface,x-lengthdir_x(offsetDist,offsetDir+angle)*scale+random_range(-2,2)*damagedAmount,y-lengthdir_y(offsetDist,offsetDir+angle)*scale+random_range(-2,2)*damagedAmount,scale,scale,angle,c_white,1);

	if (damaged) {
		shader_set(shWhite);
		shader_set_uniform_f(uFlash, flashing * 0.8);
		draw_surface_ext(surface,x-lengthdir_x(offsetDist,offsetDir+angle)*scale+random_range(-2,2)*damagedAmount,y-lengthdir_y(offsetDist,offsetDir+angle)*scale+random_range(-2,2)*damagedAmount,scale,scale,angle,c_white,1);
		shader_reset();
	}
} else {
	draw_sprite_ext(sprite_index,image_index,x,y,scale*image_xscale,scale,angle,c_white,1);	
}