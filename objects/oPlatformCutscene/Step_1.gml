/// @desc 

EnableLive;

if (object_index == oPlatformCutscene) {
	var _spd = 10;
	if (yPosTarget == ystart) _spd = (yPosTarget - yPosStart) * 0.05;
	yPos = ApproachFade(yPos,yPosTarget,_spd,0.7);
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