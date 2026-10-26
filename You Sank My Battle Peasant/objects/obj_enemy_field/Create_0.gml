alarm_set(0,2)
count = 0
_ping_x=x-global_x
_ping_y=y
monster = 0
_unit = global.unit_type[monster]
_struct_unit = global.unit[$ _unit]

_x=x
_x_last = _x
_y = y
_y_last = _y
_start_speed = 2

show_link = false

_speed = _start_speed
_size = normal_unit

facing=1

count = 0 //animation id call ["Idle","Walk","Hurt","Death","Attack01","Attack02"]
last_count = 0

image_speed = .5
dest_x=x
dest_y=y
max_distance = 0

_alpha = 0


//call movement
march = function(){
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