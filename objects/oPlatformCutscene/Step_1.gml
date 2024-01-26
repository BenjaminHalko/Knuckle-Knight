/// @desc 

EnableLive;

if (object_index == oPlatformCutscene) {
	yPos = ApproachFade(yPos,yPosTarget,10,0.7);
	if (yPos == yPosTarget) {
		if (yPosTarget == ystart)
			instance_change(oPlatform,false);
		else
			instance_destroy();
	}
}

y = round(yPos+activePercent*5+Wave(-6,0,2,waveOffset)*float*(1-activePercent*0.6));
var _y = (y - ystart);
for(var i = 0; i < numSpikes; i++) {
	with(spikes[i]) {
		y = ystart + _y;	
	}
}