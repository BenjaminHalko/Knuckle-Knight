/// @desc Initialize Platform

EnableLive;

yPos = y;
yPosTarget = ystart;
yPosStart = 0;
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
	yPos = oCamera.y + 300;
	y = yPos;
	yPosStart = y;
}

var _y = (y - ystart);
for(var i = 0; i < numSpikes; i++) {
	with(spikes[i]) {
		y = ystart + _y;	
	}
}