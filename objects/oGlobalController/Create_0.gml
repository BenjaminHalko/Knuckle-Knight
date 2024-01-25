/// @desc Setup

// Debug
instance_create_depth(0,0,0,obj_gmlive);
instance_create_depth(0,0,0,oDebug);

// OSType
GetOsType();

// Window Size
window_set_size(RESW * 2, RESH * 2);
window_center();

// Surface
surface_resize(application_surface, RESW, RESH);

// Goto Next Room
room_goto_next();