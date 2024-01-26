EnableLive;

draw_self();
shader_set(shPlatformFade);
shader_set_uniform_f(uTexelY, texelY);
shader_set_uniform_f(uTexelHeight, texelHeight);
draw_sprite_ext(sPlatformArm,0,x,y+sprite_height-1,1,2,0,c_white,1);
shader_reset();