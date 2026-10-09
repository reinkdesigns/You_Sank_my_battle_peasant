var _w = keyboard_check_pressed(ord("W"))
if _w _wild = (_wild + 1) mod global.max_wildmagic;

var _s = keyboard_check_pressed(ord("S"))
if _s _wild = 0


_mouse_over = (point_in_rectangle(mouse_x, mouse_y, _place_x1, _place_y1, _place_x2, _place_y2))

if _mouse_over && mouse_check_button_pressed(mb_left){
	_wild_x = mouse_x
	_wild_y = mouse_y
	}
wild = warp_placement(_wild_x,_wild_y,50,50,_wild)
