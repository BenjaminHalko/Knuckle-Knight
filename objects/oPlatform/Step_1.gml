/// @desc 

EnableLive;

y = round(yPos+activePercent*2+Wave(-6,0,2,waveOffset)*float*(1-activePercent*0.6));
var _y = (y - ystart);
for(var i = 0; i < numSpikes; i++) {
	with(spikes[i]) {
		y = ystart + _y;	
	}
}
