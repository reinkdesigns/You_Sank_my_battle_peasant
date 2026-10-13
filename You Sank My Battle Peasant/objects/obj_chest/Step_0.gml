if (keyboard_check_pressed(ord("O")))
{
    _state = !_state;
    image_speed = 1;
    image_index = 0;
    show_debug_message("O pressed, state: " + string(_state));
}

if (keyboard_check_pressed(vk_space))
{
    var _ran1 = irandom(2);
    var _ran2 = irandom(2);
	fade = false
	alpha = 1

    _state = 0;
    chest_animation_state = $"{global.chest_size[_ran1]}{global.chest_type[_ran2]}";
}

_sprite = asset_get_index($"{chest_animation_state}{global.chest_state[_state]}");

if (_sprite != -1 && sprite_index != _sprite)
{
    sprite_index = _sprite;
    image_index = 0;
    image_speed = 1;
}

if fade alpha -= 0.1