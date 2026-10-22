var _w = keyboard_check_pressed(ord("W"))
if _w _wild = (_wild + 1) mod global.max_wildmagic;

var _s = keyboard_check_pressed(ord("S"))
if _s _wild = 2

if keyboard_check_pressed(ord("Y")) {
var _unit = irandom(array_length(global.unit_type)-1)
summon_unit(_unit)

}



_mouse_over = (point_in_rectangle(mouse_x, mouse_y, global.spell_field.x1, global.spell_field.y1, global.spell_field.x2, global.spell_field.y2))


if spelltype = spellshape.square{
	if _mouse_over && mouse_check_button_pressed(mb_left){
		_wild_x = mouse_x
		_wild_y = mouse_y
		wild = warp_square(_wild_x,_wild_y,_width,_width,_wild)
		}
	
}

if spelltype = spellshape.radius{
	if _mouse_over && mouse_check_button_pressed(mb_left){
		_wild_x = mouse_x
		_wild_y = mouse_y
		wild = warp_radius(_wild_x,_wild_y,_width,_wild)
		}
	
}


if spelltype = spellshape.line{
	if mouse_check_button_pressed(mb_right){ 
		click = 0
		//kill 1st point
		_mouse_loc[0].x = -1000
		_mouse_loc[0].y = -1000
		_mouse_loc[1].x = -1000
		_mouse_loc[1].y = -1000
	}
	if _mouse_over && mouse_check_button_pressed(mb_left){
		_mouse_loc[click].x = mouse_x
		_mouse_loc[click].y = mouse_y
		click ++
		
	}

		if click == 2{
		click = 0
		wild = warp_line(
			_mouse_loc[0].x,
			_mouse_loc[0].y,
			_mouse_loc[1].x,
			_mouse_loc[1].y,
			_width,
			_wild
		)
		alarm_set(0,10)

		}

}
