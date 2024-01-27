function GeneratePlatforms(_seed, _amount) {
	layer_destroy_instances("GeneratedPlatforms");
	layer_destroy_instances("GeneratedSpikes");
	with(oPlatformGenerator) {
		random_set_seed(_seed);
		platformsToGenerate = [];
		platformY = -room_height/2;
		for(var i = 0; i < _amount; i++) {
			array_push(platformsToGenerate,{
				index: platforms[irandom(numLayouts-1)],
				scale: choose(1,-1)
			});
			
		}
	}
}

function NextPlatforms() {
	with(oPlatformGenerator) {
		if (array_length(platformsToGenerate) == 0) return;
		var _platforms = platformsToGenerate[0].index;
		var _scale = platformsToGenerate[0].scale;
		array_delete(platformsToGenerate,0,1);
			for(var j = 0; j < array_length(_platforms.data); j++) {
					var _element = _platforms.data[j];
					instance_create_layer(_element.x*_scale+room_width/2,room_height+_element.y+platformY,(_element.object_index == oPlatform ? "GeneratedPlatforms" : "GeneratedSpikes"),(_element.object_index == oPlatform ? oPlatformCutscene : _element.object_index),{
						image_xscale: _element.image_xscale*_scale
					});
				}
				platformY += _platforms.height;
	}
}