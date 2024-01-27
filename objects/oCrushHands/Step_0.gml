/// @description Insert description here
// You can write your code in this editor


EnableLive;

if (wait) {
	y = ApproachFade(y,targetY,10,0.6);
	if (y == targetY) {
		timer--;
		if (timer < 0) wait = false;
	}
} else if (!collided) {
	if (array_length(move_and_collide(0,10,oPlatform)) > 0) {
		ScreenShake(10,10);
		audio_play_sound(snCollide,1,false);
		collided = true;
		timer = 20;
	}
} else if (--timer <= 0) {
	y -= 10;
	image_alpha -= 0.02;
	if (image_alpha <= 0) instance_destroy();
}