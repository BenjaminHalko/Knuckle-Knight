/// @desc

EnableLive;

platforms = [];

var _roomInfo = room_get_info(room,false,false,true,true).layers;

for(var i = 0; i < array_length(_roomInfo); i++) {
	var _layer = _roomInfo[i];
	if (string_starts_with(_layer.name, "Platforms_")) {
		var _maxHeight = 0;
		var _data = [];
		for(var j = 0; j < array_length(_layer.elements); j++) {
			var _element = layer_instance_get_instance(_layer.elements[j].id);
			_maxHeight = min(_maxHeight, _element.y-room_height);
			array_push(_data, {
				x: _element.x,
				y: _element.y-room_height,
				image_xscale: _element.image_xscale
			});
		}
		array_push(platforms, {
			data: _data,
			height: _maxHeight
		});
		layer_destroy(_layer.name);
	}
}

numLayouts = array_length(platforms);

show_debug_message(platforms);