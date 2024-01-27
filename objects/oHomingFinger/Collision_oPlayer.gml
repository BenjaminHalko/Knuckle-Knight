/// @description Insert description here
// You can write your code in this editor

EnableLive;
if (oBoss.timer > 0) {
	// Inherit the parent event
	event_inherited();
	oBoss.timer -= 1.5;
	if (oPlayer.invincibility > 0)
		oBoss.timer -= 1;
}