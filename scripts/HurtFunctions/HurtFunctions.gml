function HurtPlayer(_player, _takeDamage=true) {
	if (live_call(_player, _takeDamage)) return live_result;
	if (_player.dashing <= 0) {
		_player.knockback = sign(_player.x-x) * _player.maxwalk;
		_player.vsp = -7;
		if (_takeDamage) {
			if (_player.invincibility <= 0) {
				
				_player.hp--;
				if (_player.hp <= 0) {
					global.death = true;
					_player.knockback = sign(room_width/2-_player.x) * _player.maxwalk * 1.5;
					_player.vsp = -10;
				} else {
					_player.invincibility = 60 * 2;
				}
				audio_play_sound(snHurt,1,false);
			}
		}
		_player.dashing = 0;
		_player.dashInControl = true;
		_player.canDash = true;
	}
}