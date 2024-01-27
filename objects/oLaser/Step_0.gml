/// @description Insert description here
// You can write your code in this editor
EnableLive;


image_xscale = Approach(image_xscale,20,1);

repeat(20) {
		//         
		var _len = random(sprite_width);
		CreateParticle(x+lengthdir_x(_len, image_angle),y+lengthdir_y(_len, image_angle),oCircleParticle,random(360),10,random_range(0.05,0.1),random_range(0.1,5),random_range(0,360),c_white);	
	}
	
	
	//lengthdir_x(sprite_width, image_angle)
	