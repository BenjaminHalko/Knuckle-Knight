/// @desc 

transitionPercent = Approach(transitionPercent, leading, transitionSpd);
if (transitionPercent == 1) {
	leading = false;
	room_goto(targetRoom);	
} else if (transitionPercent == 0) {
	instance_destroy();	
}