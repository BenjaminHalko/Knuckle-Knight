/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_font(fFont);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text_transformed(room_width/2,300,"PRESS START",2+Wave(-0.1,0.4,1.5,0.3),2,5);