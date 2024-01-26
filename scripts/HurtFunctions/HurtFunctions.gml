function HurtPlayer(_player, _takeDamage=false) {
	if (live_call(_player, _takeDamage)) return live_result;
	if (_player.dashing <= 0 or object_index == oBoss) {
		_player.knockback = sign(_player.x-x) * _player.maxwalk;
		if (object_index == oBoss)
			_player.knockback *= 1.5;
		_player.vsp = -7;
		if (_takeDamage) {
			if (_player.invincibility <= 0) {
				_player.invincibility = 60 * 2;
				_player.hp--;
			}
		}
		_player.dashing = 0;
		_player.dashInControl = true;
	}
}