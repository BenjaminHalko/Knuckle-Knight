enum OS {
	OSBROWSER,
	OSOPERA,
	OSMOBILE,
	OSDESKTOP
}

function GetOsType() {
	if(os_type == os_operagx) global.ostype = OS.OSOPERA;
	else if(os_browser != browser_not_a_browser) global.ostype = OS.OSBROWSER;
	else if(os_type == os_android) global.ostype = OS.OSMOBILE;
	else global.ostype = OS.OSDESKTOP;
	
	if OPERA {
		var _info = os_get_info();
		global.mobileOperaGX = _info[? "mobile"];
		ds_map_destroy(_info);
	} else {
		global.mobileOperaGX = false;	
	}
}