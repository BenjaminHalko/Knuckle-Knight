/// @desc Get Scores

if (async_load[? "type"] == "FirebaseRealTime_Read" or async_load[? "type"] == "FirebaseRealTime_Listener") {
	if (async_load[? "status"] == 200) {
		var _data = async_load[? "value"];
		if !is_undefined(_data) {
			var _value = json_parse(_data);
			var _names = variable_struct_get_names(_value);
			scores = array_create(array_length(_names));
		
			for(var i = 0; i < array_length(_names); i++) {
				try {
					var _scoreData = variable_struct_get(_value, _names[i]);
					scores[i] = {
						name: _names[i],
						points: _scoreData.points,
						level: _scoreData.level
					}
				} catch(_error) {
					scores[i] = {
						name: _names[i],
						points: 0,
						level: 0
					}
				}
			}
			
			array_sort(scores, function(_ele1,_ele2){
				return (_ele2.points - _ele1.points)
			});
			
			global.highscore = scores[0].points;
		}
	}
}