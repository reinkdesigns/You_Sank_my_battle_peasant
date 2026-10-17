if count !=3 image_speed = 0.5
depth = 1-(y / room_height) * 100;
_speed = _start_speed;

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
if (keyboard_check_pressed(vk_space)) {
    var _pad_x = sprite_width / 2 + field_buffer;
    var _pad_y = sprite_height / 2 + field_buffer;

    var _min_x = global.enemy_field.x1 + _pad_x;
    var _max_x = global.enemy_field.x2 - _pad_x;
    var _min_y = global.enemy_field.y1 + _pad_y;
    var _max_y = global.enemy_field.y2 - _pad_y;

    // Choose a random direction and distance from current position.
    var _dir = irandom(359);
    var _dist = random_range(max_distance * 0.4, max_distance);

    var _target_x = x + lengthdir_x(_dist, _dir);
    var _target_y = y + lengthdir_y(_dist, _dir);

    // Keep the destination inside the field.
    dest_x = clamp(_target_x, _min_x, _max_x);
    dest_y = clamp(_target_y, _min_y, _max_y);
}


_x = x
_y = y

moved = (_x != _x_last)||(_y != _y_last)


if moved{
	if (_x != _x_last) facing = sign(_x - _x_last)

	count = 1
} else if count == 1 count = 0

	_y_last = _y
	_x_last = _x


if count !=3 image_speed = 0.5


if count != last_count {
image_index = 0
last_count = count


}

if count != 0 && count !=3 busy = true

//global.unit_animation	=["Idle","Walk","Hurt","Death","Attack01","Attack02"]