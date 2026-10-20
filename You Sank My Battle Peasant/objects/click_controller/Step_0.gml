var _w = keyboard_check_pressed(ord("W"))
if _w _wild = (_wild + 1) mod global.max_wildmagic;

var _s = keyboard_check_pressed(ord("S"))
if _s _wild = 0

if keyboard_check_pressed(ord("Y")) {
var _unit = irandom(array_length(global.unit_type)-1)
summon_unit(_unit)

}


_mouse_over = (point_in_rectangle(mouse_x, mouse_y, global.spell_field.x1, global.spell_field.y1, global.spell_field.x2, global.spell_field.y2))

if _mouse_over && mouse_check_button_pressed(mb_left){
	_wild_x = mouse_x
	_wild_y = mouse_y
	}
wild = warp_placement(_wild_x,_wild_y,50,50,_wild)

