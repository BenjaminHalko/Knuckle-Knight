/// @desc Activate Platform

EnableLive;

var _lastActive = active;
active = false;
with(oPlayer) {
	if y <= other.bbox_top and vsp >= 0 and place_meeting(x,y+1,other.id) {
		other.active = true;
	}
}
activePercent = ApproachFade(activePercent,active,0.2,0.7);