function Transition() {
	if (!instance_exists(oTransition)) {
		instance_create_depth(0,0,-10000,oTransition);
	}
}