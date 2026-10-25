var _w = keyboard_check_pressed(ord("W"))
if _w _wild = (_wild + 1) mod global.max_wildmagic;

var _s = keyboard_check_pressed(ord("S"))
if _s _wild = 2

if keyboard_check_pressed(ord("Y")) {
var _unit = irandom(array_length(global.unit_type)-1)
summon_unit(_unit)

}

if global._ping_alpha > 0 global._ping_alpha -= 0.02

_mouse_over = (point_in_rectangle(mouse_x, mouse_y, global.spell_field.x1, global.spell_field.y1, global.spell_field.x2, global.spell_field.y2))

if the_march.step = 0{

	if global.spell_deck[0].type = "square"{
		if _mouse_over && mouse_check_button_pressed(mb_left){
			_wild_x = mouse_x
			_wild_y = mouse_y
			wild = cast_square(_wild_x,_wild_y,_width,_width)
		
			}
	
	}

	if global.spell_deck[0].type = "AOE"{
		if _mouse_over && mouse_check_button_pressed(mb_left){
			_wild_x = mouse_x
			_wild_y = mouse_y
			wild = cast_radius(_wild_x,_wild_y,_width)
			}
	}

	if global.spell_deck[0].type = "freecast"{
		if _mouse_over && mouse_check_button_pressed(mb_left){
			_wild_x = mouse_x
			_wild_y = mouse_y
			wild = warp_radius(_wild_x,_wild_y,_width,_wild)
			}
	}

	if global.spell_deck[0].type == "line" {
	    // Right-click: reset line placement.
	    if (mouse_check_button_pressed(mb_right)) {
	        click = 0;
	        drag_flag = false;

	        _mouse_loc[0].x = -1000;
	        _mouse_loc[0].y = -1000;
	        _mouse_loc[1].x = -1000;
	        _mouse_loc[1].y = -1000;
	    }

	    // Left-click: set position 1, or position 2 if position 1 exists.
	    if (_mouse_over && mouse_check_button_pressed(mb_left)) {
	        if (click == 0) {
	            _mouse_loc[0].x = mouse_x;
	            _mouse_loc[0].y = mouse_y;

	            mark_x = mouse_x;
	            mark_y = mouse_y;

	            drag_flag = false;
	            click = 1;
	        }
	        else {
	            // Second click: place position 2.
	            _mouse_loc[1].x = mouse_x;
	            _mouse_loc[1].y = mouse_y;

	            click = 2;
	        }
	    }

	    // Holding left mouse: detect dragging from position 1.
	    if (click == 1 && mouse_check_button(mb_left)) {
	        if (point_distance(mark_x, mark_y, mouse_x, mouse_y) > 100) {
	            drag_flag = true;
	        }
	    }

	    // Release after dragging: place position 2.
	    if (click == 1 && drag_flag && mouse_check_button_released(mb_left)) {
	        _mouse_loc[1].x = mouse_x;
	        _mouse_loc[1].y = mouse_y;

	        click = 2;
	    }

	    // Both points placed: apply Wild Magic.
	    if (click == 2) {
	        click = 0;
	        drag_flag = false;

	        wild = cast_line(
	            _mouse_loc[0].x,
	            _mouse_loc[0].y,
	            _mouse_loc[1].x,
	            _mouse_loc[1].y,
	            global.spell_deck[0].width,
				global.spell_deck[0].range
	        );

	        alarm_set(0, 10);
	    }
	}
	
}