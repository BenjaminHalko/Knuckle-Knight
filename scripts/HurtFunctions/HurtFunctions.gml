function HurtPlayer(_player, _takeDamage=true) {
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
				audio_play_sound(snHurt,1,false);
			}
		}
		_player.dashing = 0;
		_player.dashInControl = true;
		_player.canDash = true;
	}
}