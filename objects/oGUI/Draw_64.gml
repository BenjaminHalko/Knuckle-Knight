/// @desc Draw GUI

EnableLive;

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

draw_text_transformed(room_width/2,_y,"SCORE",1.5,1.5,0);
draw_text_transformed(room_width/2,_y+14,_displayString(global.score, 5),1.5,1.5,0);

draw_text_transformed(room_width/4*3,_y,"LEVEL",1.5,1.5,0);
draw_text_transformed(room_width/4*3,_y+14,global.level,1.5,1.5,0);

draw_text_transformed(room_width/4-20,_y,"LIFE",1.5,1.5,0);
draw_text_transformed(room_width/4-20,_y+14,"FORCE",1.5,1.5,0);
draw_sprite(sHP,oPlayer.hp,room_width/4+16,_y+12);