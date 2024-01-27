/// @param {real} x X spawn pos
/// @param {real} y Y spawn pos
/// @param {real} object Particle object
/// @param {real} angle Angle of particle
/// @param {real} effectSpd How quickly the effect dies off
/// @param {real} speed How quickly the particle moves
/// @param {real} direction Movement direciton
/// @param {real} blend Particle color tint
function CreateParticle(_x, _y, _object, _angle, _size, _effectSpd, _speed, _direction, _blend) {
	with(instance_create_depth(_x,_y,-1000,_object)) {
		image_angle = _angle;
		size = _size;
		spd = _effectSpd;
		speed = _speed;
		direction = _direction;
		image_blend = _blend;
	}
}


/// @param {real} x X spawn pos
/// @param {real} y Y spawn pos
/// @param {real} sprite Particle sprite
/// @param {real} angle Angle of particle
/// @param {real} effectSpd How quickly the effect dies off
/// @param {real} speed How quickly the particle moves
/// @param {real} direction Movement direciton
/// @param {real} blend Particle color tint
function CreateParticleSprite(_x, _y, _sprite, _angle, _size, _effectSpd, _speed, _direction, _blend) {
	with(instance_create_depth(_x,_y,-1000,oSpriteParticle)) {
		image_angle = _angle;
		size = _size;
		spd = _effectSpd;
		image_xscale = _size;
		image_yscale = _size;
		speed = _speed;
		direction = _direction;
		image_blend = _blend;
		sprite_index = _sprite;
	}
}