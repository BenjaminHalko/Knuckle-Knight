function Input() {
	var _gpLeft = false;
	var _gpRight = false;
	var _gpUp = false;
	var _gpDown = false;
	var _gpJump = false;
	var _deadzone = 0.2;
	for(var i = 0; i < gamepad_get_device_count(); i++) {
		if(gamepad_button_check(i,gp_padl) or gamepad_axis_value(i,gp_axislh) <= -_deadzone) _gpLeft = true;
		if(gamepad_button_check(i,gp_padr) or gamepad_axis_value(i,gp_axislh) >= _deadzone) _gpRight = true;
		if(gamepad_button_check(i,gp_padu) or gamepad_axis_value(i,gp_axislv) <= -_deadzone) _gpUp = true;
		if(gamepad_button_check(i,gp_padd) or gamepad_axis_value(i,gp_axislv) >= _deadzone) _gpDown = true;
		if(gamepad_button_check(i,gp_start)) game_restart();
		for(var j = gp_face1; j <= gp_face4; j++) if(gamepad_button_check_pressed(i,j)) _gpJump = true;
	}
	
	keyLeft =	keyboard_check(vk_left) or keyboard_check(ord("A")) or _gpLeft;
	keyRight =	keyboard_check(vk_right) or keyboard_check(ord("D")) or _gpRight;
	keyUp =		keyboard_check(vk_up) or keyboard_check(ord("W")) or _gpUp;
	keyDown =	keyboard_check(vk_down) or keyboard_check(ord("S")) or _gpDown;
	keyJump =	keyboard_check_pressed(vk_space) or
				keyboard_check_pressed(vk_shift) or
				keyboard_check_pressed(vk_control) or
				_gpJump;
}