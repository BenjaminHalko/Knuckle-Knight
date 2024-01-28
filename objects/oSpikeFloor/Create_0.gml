/// @desc

var _hand = instance_create_depth(room_width/3,room_height-8,depth-1,oEvilHands,{
	image_xscale: -1,
});
_hand.attack = false;
_hand = instance_create_depth(room_width/3*2,room_height-8-32,depth-1,oEvilHands);
_hand.attack = false;

hands = [];