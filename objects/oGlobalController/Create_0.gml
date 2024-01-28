/// @desc Setup

// OSType
GetOsType();

// Window Size
window_set_size(RESW * 2, RESH * 2);
window_center();

// Surface
surface_resize(application_surface, RESW, RESH);
display_set_gui_size(RESW, RESH);

// Goto Next Room
room_goto_next();