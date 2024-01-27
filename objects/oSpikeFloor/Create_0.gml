/// @desc

EnableLive;

var _hand = instance_create_layer(room_width/3,y,layer,oEvilHands,{
	image_xscale: -1,
});
_hand.attack = false;
_hand = instance_create_layer(room_width/3*2,y-32,layer,oEvilHands);
_hand.attack = false;