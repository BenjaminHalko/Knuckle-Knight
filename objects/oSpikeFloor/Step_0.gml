/// @desc

repeat(8) {
	var _scale = random_range(0.2,0.5);
	array_push(hands, {
		x: random(room_width),
		y: room_height-8+10,
		image_blend: merge_color(c_maroon,c_red,random(1)),
		image_alpha: 0.5,
		image_xscale: _scale * choose(1,-1),
		image_yscale: _scale
	});
}

for(var i = 0; i < array_length(hands); i++) {
	hands[i].y--;
	hands[i].image_alpha -= 0.01;
	if (hands[i].image_alpha <= 0) {
		array_delete(hands,i,1);
		i--;
	}
}