if (keyboard_check(ord("R"))) {
    if (mouse_check_button_pressed(mb_left)) {
        measuring = true;

        start_x = mouse_x;
        start_y = mouse_y;
        end_x = mouse_x;
        end_y = mouse_y;
    }

    if (measuring && mouse_check_button(mb_left)) {
        end_x = mouse_x;
        end_y = mouse_y;

        distance = point_distance(
            start_x, start_y,
            end_x, end_y
        );
    }
}
else {
    measuring = false;
}

if (!mouse_check_button(mb_left)) {
    measuring = false;
}

if point_in_rectangle(
			mouse_x,
			mouse_y,
			global.spell_field.x1,
			global.spell_field.y1,
			global.spell_field.x2,
			global.spell_field.y2
	){
	if (mouse_check_button_pressed(mb_right) && !mouse_check_button(mb_left)) {
		array_insert(mark,0,[mouse_x,mouse_y])
		if array_length(mark)>max_marks array_pop(mark)
		}
}
	