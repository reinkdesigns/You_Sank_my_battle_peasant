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
    // 1. Calculate the padding (Half the sprite size + buffer)
    var _pad_x = (sprite_width / 2) + field_buffer;
    var _pad_y = (sprite_height / 2) + field_buffer;
    
    // 2. Shrink the random ranges inward so the unit can't hang out
    var _min_x = global.enemy_field.x1 + _pad_x;
    var _max_x = global.enemy_field.x2 - _pad_x;
    
    var _min_y = global.enemy_field.y1 + _pad_y;
    var _max_y = global.enemy_field.y2 - _pad_y;
    
    // 3. Pick a completely random target point inside the safe boundaries
    var _target_x = irandom_range(_min_x, _max_x);
    var _target_y = irandom_range(_min_y, _max_y);
    
    // 4. Check how far away that chosen point is
    var _dist = point_distance(x, y, _target_x, _target_y);
    
    if (_dist <= max_distance) {
        // If it's within range, use it directly!
        dest_x = _target_x;
        dest_y = _target_y;
    } else {
        // If it's too far, get the direction to that point...
        var _dir = point_direction(x, y, _target_x, _target_y);
        
        // ...and set the destination exactly "max_distance" units away!
        dest_x = x + lengthdir_x(max_distance, _dir);
        dest_y = y + lengthdir_y(max_distance, _dir);
    }
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