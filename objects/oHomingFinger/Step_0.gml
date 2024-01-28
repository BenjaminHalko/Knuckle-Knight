/// @description Insert description here
// You can write your code in this editor

if (!trail) {
	if(--timer<=0) {
		audio_stop_sound(snTick);
		audio_play_sound(snTick,1,false);
		instance_create_depth(x,y,depth+1,oHomingFinger,{
			image_angle: image_angle	
		});
		timer = 2;
	}
	
	image_angle = ApproachCircleEase(image_angle,point_direction(x,y,oPlayer.x,oPlayer.y),10,0.8);
	direction = image_angle;
	
	if (oBoss.timer <= 0) {
		audio_stop_sound(snTick);
		trail = true;
		speed = 0;
		fadeDelay = instance_number(oHomingFinger) * 0.3;
	}
} else if (oBoss.timer <= 0) {
	fadeDelay--;
	if (fadeDelay <= 0) {
		image_alpha -= 0.05;
		if (image_alpha <= 0) instance_destroy();
	}
}