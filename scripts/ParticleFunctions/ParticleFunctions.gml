function CreateParticle(_x, _y, _object, _angle, _size, _effectSpd, _speed, _direction) {
	with(instance_create_depth(_x,_y,-1000,_object)) {
		image_angle = _angle;
		size = _size;
		spd = _effectSpd;
		speed = _speed;
		direction = _direction;
	}
}