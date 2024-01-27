/// @description Insert description here
// You can write your code in this editor


EnableLive;


// Inherit the parent event
event_inherited();

oPlayer.vsp = -12;
oPlayer.hsp = 0;
oPlayer.knockback = sign(room_width/2-oPlayer.x) * 3;