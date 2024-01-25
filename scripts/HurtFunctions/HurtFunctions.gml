function HurtPlayer(_player) {
	if (_player.dashing <= 0) {
		_player.knockback = sign(_player.x-x);
		_player.vsp = -7;
		if (_player.invincibility <= 0) {
			_player.invincibility = 60 * 2;
			_player.hp--;
		}
	}
}