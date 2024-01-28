/// @desc

if (room != rTitle and room != rInit) {
	platforms = [];
	var _roomInfo = room_get_info(room,false,false,true,true).layers;
	for(var i = 0; i < array_length(_roomInfo); i++) {
		var _layer = _roomInfo[i];
		if (string_starts_with(_layer.name, "Platform_")) {
			var _maxHeight = 0;
			var _data = [];
			for(var j = 0; j < array_length(_layer.elements); j++) {
				var _element = layer_instance_get_instance(_layer.elements[j].id);
				_maxHeight = min(_maxHeight, _element.y-room_height);
				array_push(_data, {
					x: _element.x-room_width/2,
					y: _element.y-room_height,
					image_xscale: _element.image_xscale,
					object_index: _element.object_index
				});
			}
			array_sort(_data, function(_a, _b) {
				return (_a.object_index == oPlatform) - (_b.object_index == oPlatform);
			});
			array_push(platforms, {
				data: _data,
				height: _maxHeight
			});
			layer_destroy(_layer.name);
		}
	}

	numLayouts = array_length(platforms);
	
	GeneratePlatforms(1,5);
}