/// @desc

EnableLive;

image_blend = merge_color(c_maroon,c_red,random(1));
speed = 1;
direction = 90
spd = 0.01;
image_alpha = 0.5;

image_xscale = random_range(0.2,0.5);
image_yscale = image_xscale;
image_xscale *= choose(1,-1);