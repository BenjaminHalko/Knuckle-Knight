function ScreenShake(_magnitude,_frames) {
	with(oCamera) {
		if(_magnitude > shakeRemain) {
			shakeMagnitude = _magnitude;
			shakeRemain = _magnitude;
			shakeLength = _frames;
		}
	}
}