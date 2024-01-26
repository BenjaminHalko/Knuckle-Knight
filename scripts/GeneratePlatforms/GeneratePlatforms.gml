function GeneratePlatforms(_seed, _amount) {
	if (live_call(_seed, _amount)) return live_result;
	layer_destroy_instances("GeneratedPlatforms");
	with(oPlatformGenerator) {
		random_set_seed(_seed);
		var _y = -room_height/2;
		for(var i = 0; i < _amount; i++) {
			var _index = irandom(numLayouts-1);
			var _platforms = platforms[_index];
			for(var j = 0; j < array_length(_platforms.data); j++) {
				var _element = _platforms.data[j];
				show_debug_message(_element.y);
				instance_create_layer(_element.x,room_height+_element.y+_y,"GeneratedPlatforms",oPlatform,{
					image_xscale: _element.image_xscale
				});
			}
			_y += _platforms.height;
		}
	}
}