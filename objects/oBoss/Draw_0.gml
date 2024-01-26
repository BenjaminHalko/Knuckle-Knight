/// @desc

EnableLive;

surface_set_target(surface);
draw_clear_alpha(c_black,0);
draw_sprite(sprite_index,image_index,sprite_xoffset,sprite_yoffset);
draw_sprite(sBossEye,2,sprite_xoffset,sprite_yoffset);
var _dir = point_direction(x,y,oPlayer.x,oPlayer.y-16)-angle;
var _len = min(5, point_distance(x,y,oPlayer.x,oPlayer.y-16));
draw_sprite(sBossEye,0,sprite_xoffset+lengthdir_x(_len, _dir), sprite_yoffset+lengthdir_y(_len*0.7, _dir));
draw_sprite(sBossEye,1,sprite_xoffset,sprite_yoffset);
surface_reset_target();


draw_surface_ext(surface,x-lengthdir_x(offsetDist,offsetDir+angle)*scale,y-lengthdir_y(offsetDist,offsetDir+angle)*scale,scale,scale,angle,c_white,1);