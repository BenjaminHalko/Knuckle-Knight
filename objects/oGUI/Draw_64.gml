/// @desc Draw GUI

draw_set_color(c_black);
draw_rectangle(0,0,RESW,INFO_HEIGHT,false);

var _displayString = function(_num, _digits) {
	return string_replace_all(string_format(_num,_digits,0)," ","0");
}

// Draw Score
var _y = 12;
draw_set_font(fFont);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text_transformed(room_width/3-40,_y,"LIFE",1.5,1.5,0);
draw_text_transformed(room_width/3-40,_y+14,"FORCE",1.5,1.5,0);
draw_sprite(sHP,oPlayer.hp,room_width/3,_y+12);

draw_text_transformed(room_width/2+60,_y,"EVIL",1.5,1.5,0);
draw_text_transformed(room_width/2+60,_y+14,"ENERGY",1.5,1.5,0);

var _rectX = room_width/2+60+50;
var _rectY = 16;
var _rectHealth = 100;
var _rectY2 = _rectY+16;
draw_set_color(make_color_hsv(245,(1-grey)*255,255));
draw_rectangle(_rectX,_rectY,_rectX+_rectHealth,_rectY2,true);
if (oBoss.hp > 0) {
	draw_rectangle(_rectX+2,_rectY+2,_rectX+_rectHealth*(oBoss.hp/oBoss.maxHP)-2,_rectY2-2,false);
}
