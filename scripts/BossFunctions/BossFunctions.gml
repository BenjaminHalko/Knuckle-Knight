function moveToPoint(_x,_y) {
	dir = point_direction(x,y,_x,_y);
	var _dist = point_distance(x,y,_x,_y);
	movespd = ApproachFade(movespd,min(_dist/8,10),0.3,0.7);
	if (_dist < movespd) {
		x = _x;
		y = _y;
	} else {
		x += lengthdir_x(movespd, dir);
		y += lengthdir_y(movespd, dir);
	}	
}