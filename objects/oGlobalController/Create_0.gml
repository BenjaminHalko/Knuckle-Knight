/// @desc Setup

// Create GMLive
instance_create_depth(0,0,0,obj_gmlive);

// Window Size
window_set_size(ResW * 2, ResH * 2);
window_center();

// Surface
surface_resize(application_surface, ResW, ResH);

// Goto Next Room
room_goto_next();