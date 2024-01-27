/// @description Insert description here
// You can write your code in this editor
EnableLive;


image_xscale = Approach(image_xscale,20,1);
image_yscale = 0.25;
image_blend = c_orange;

repeat(20) {
		//         
		var _len = random(sprite_width);
		CreateParticle(x+lengthdir_x(_len, image_angle),y+lengthdir_y(_len, image_angle),oCircleParticle,random(360),10,random_range(0.05,0.1),random_range(1,5),random_range(-30,30)+ 180 +image_angle,c_red);	
	}
	
	
	//lengthdir_x(sprite_width, image_angle)
	