/// @desc Initialize Platform

EnableLive;

sprite_index = sPlatform;
image_xscale = image_xscale * (147/449);
image_yscale = image_yscale * (147/449);

yPos = y;
yPosTarget = ystart;
activePercent = 0;
active = false;
waveOffset = random(1);


var _uvs = sprite_get_uvs(sPlatformArm,0);
texelY = _uvs[1];
texelHeight = _uvs[3] - _uvs[1];
uTexelY = shader_get_uniform(shPlatformFade, "texelY");
uTexelHeight = shader_get_uniform(shPlatformFade, "texelHeight");


// Get spikes
var _list = ds_list_create();
numSpikes = instance_place_list(x,y,pHurt,_list,false);
spikes = [];
for(var i = 0; i < numSpikes; i++) {
	array_push(spikes, _list[| i]);	
}
ds_list_destroy(_list);

if (object_index == oPlatformCutscene) {
	yPos = room_height - 20;
	y = yPos;
}