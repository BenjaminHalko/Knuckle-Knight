/// @description Insert description here
// You can write your code in this editor


EnableLive;

if (!trail) {
	if(--timer<=0) {
		instance_create_depth(x,y,depth+1,oHomingFinger,{
			image_angle: image_angle	
		});
		timer = 2;
	}
	
	image_angle = ApproachCircleEase(image_angle,point_direction(x,y,oPlayer.x,oPlayer.y),10,0.8);
	direction = image_angle;
	
	if (oBoss.timer <= 0) instance_destroy();
} else if (oBoss.timer <= 0) {
	fadeDelay--;
	if (fadeDelay <= 0) {
		image_alpha -= 0.05;
		if (image_alpha <= 0) instance_destroy();
	}
}