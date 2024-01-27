/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (active and !breaking) {
	breaking = true;
	timer = 60;
}

if (breaking) {
	if (timer-- <= 0) {
		breaking = false;
		instance_change(oPlatformBroken,true);
	}
}
	