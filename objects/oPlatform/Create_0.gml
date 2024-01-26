/// @desc Initialize Platform

yPos = y;
activePercent = 0;
active = false;
waveOffset = random(1);

// Get spikes
var _list = ds_list_create();
numSpikes = instance_place_list(x,y,pHurt,_list,false);
spikes = [];
for(var i = 0; i < numSpikes; i++) {
	array_push(spikes, _list[| i]);	
}
ds_list_destroy(_list);

//array_push(spikes, instance_create);

if (!layer_get_visible(layer)) instance_destroy();