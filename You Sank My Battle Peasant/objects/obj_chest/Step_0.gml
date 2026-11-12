if take_damage {
	core.state = !core.state;
	image_speed = 1;
	image_index = 0;
	show_debug_message("O pressed, state: " + string(core.state));
	take_damage=0
	core.destroy=true
	//do coin/item stuffs
}

core.sprite = asset_get_index($"{core.chest_animation_state}{global.chest_state[core.state]}");

if (core.sprite != -1 && sprite_index != core.sprite) {
	sprite_index = core.sprite;
	image_index = 0;
	image_speed = 1;
}

if core.fade core.alpha -= 0.1
if core.alpha <=0 && core.destroy instance_destroy()