_speed = _start_speed;
depth = 1-(y / room_height) * 100;
// 1. Check total distance to destination
var _distance = point_distance(x, y, dest_x, dest_y);

// Initialize movement tracking
var move_x = 0;
var move_y = 0;

// 2. Only calculate movement if we haven't arrived yet
if (_distance > 0) {
    // Get the exact, fluid angle (0 to 360 degrees) to the destination
    var _angle = point_direction(x, y, dest_x, dest_y);
    
    // lengthdir splits your speed perfectly based on the angle (no diagonal modifier needed!)
    move_x = lengthdir_x(1, _angle);
    move_y = lengthdir_y(1, _angle);
}

// 3. Jitter Prevention & Movement
// If we are closer than our movement speed, snap to target. Otherwise, move.
if (_distance <= _speed) {
    x = dest_x;
    y = dest_y;
} else {
    x += move_x * _speed;
    y += move_y * _speed;
}

// 4. Spacebar Random Destination Selection
if the_march.all_busy=false{
	if (keyboard_check_pressed(vk_space)) the_march.step=1 //march()
	if (keyboard_check_pressed(ord("T"))) attack()
}

	//in order from 1-10 check unit within 5px of march posistion
	//check the posistion they want to move to, if its free move foward, else do nothing
	//this will be a function call elseware, probably a .method


_x = x
_y = y

moved = (_x != _x_last)||(_y != _y_last)


if moved{
	if (_x != _x_last) facing = sign(_x - _x_last)

	count = 1
} else if count == 1 count = 0

	_y_last = _y
	_x_last = _x


if keyboard_check_pressed(ord("1")) count = 2
if keyboard_check_pressed(ord("2")) {
	count = 3
	child_unit.count = 3
}

if keyboard_check_pressed(ord("Q")) count = 4
if keyboard_check_pressed(ord("E")) count = 5
if keyboard_check_pressed(ord("R")) monster = (monster+1) mod array_length(global.unit_type)

if count !=3 image_speed = 0.5


if count != last_count {
image_index = 0
child_unit.image_index = 0
last_count = count


}


if count != 0 && count !=3 busy = true

//child_unit.count = count

//global.unit_animation	=["Idle","Walk","Hurt","Death","Attack01","Attack02"]