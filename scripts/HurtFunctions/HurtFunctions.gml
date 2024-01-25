function HurtPlayer(_player) {
	_player.knockback = sign(_player.x-x);
	_player.vsp = -7;
	_player.noPlatform = 3;
}