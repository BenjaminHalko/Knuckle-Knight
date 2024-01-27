function moveToPoint(_x,_y) {
	dir = point_direction(x,y,_x,_y);
	var _dist = point_distance(x,y,_x,_y);
	spd = ApproachFade(spd,min(_dist/8,4),0.3,0.7);
	if (_dist < spd) {
		x = _x;
		y = _y;
	} else {
		x += lengthdir_x(spd, dir);
		y += lengthdir_y(spd, dir);
	}	
}