y += (keyboard_check(ord("S"))-keyboard_check(ord("W"))) *_speed

x += (keyboard_check(ord("D"))-keyboard_check(ord("A"))) *_speed
_x = x
_y = y

moved = (_x != _x_last)||(_y != _y_last)


if moved{
	
	if _x != _x_last facing = clamp((_x - _x_last)*100,-1,1)
	
	_y_last = _y
	_x_last = _x
	count = 1
} else if count == 1 count = 0



if keyboard_check_pressed(ord("1")) count = 2
if keyboard_check_pressed(ord("2")) count = 3

if keyboard_check_pressed(ord("Q")) count = 4
if keyboard_check_pressed(ord("E")) count = 5
if keyboard_check_pressed(ord("R")) monster = (monster+1) mod array_length(global.unit_type)

if count !=3 image_speed = 0.5


if count != last_count {
image_index = 0
last_count = count

}

//global.unit_animation	=["Idle","Walk","Hurt","Death","Attack01","Attack02"]