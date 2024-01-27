function HurtPlayer(_player, _takeDamage=true) {
	if (live_call(_player, _takeDamage)) return live_result;
	if (_player.dashing <= 0 and _player.hp > 0) {
		_player.knockback = sign(_player.x-x) * _player.maxwalk;
		if (object_index == oBoss)
			_player.knockback *= 1.5;
		_player.vsp = -7;
		if (_takeDamage) {
			if (_player.invincibility <= 0) {
				
				_player.hp--;
				if (_player.hp >= 0 and false) {
					call_later(5,time_source_units_frames,function() {
						global.death = true;
					});
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