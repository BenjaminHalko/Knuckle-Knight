/// @description Insert description here
// You can write your code in this editor

if (oBoss.timer > 0) {
	// Inherit the parent event
	event_inherited();
	oBoss.timer -= 1.5;
	if (oPlayer.invincibility > 0)
		oBoss.timer = 0;
}