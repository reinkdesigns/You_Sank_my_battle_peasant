if (die_on_move) {
    var _dist = point_distance(x, y, target_x, target_y);
    var _dir = point_direction(x, y, target_x, target_y);

    var _move = min(move_speed, _dist);

    x += lengthdir_x(_move, _dir);
    y += lengthdir_y(_move, _dir);

    if (_move >= _dist) {
        x = target_x;
        y = target_y;
        alarm[0] = 1;
    }
}


// Calculate rectangle boundaries, centered on the spell.
_x1 = x + _r1
_y1 = y + _r2
_x2 = x - _r1
_y2 = y - _r2

// Find enemies overlapping the rectangle.
var candidates = ds_list_create();

collision_rectangle_list(
    _x1, _y1,
    _x2, _y2,
    obj_enemy_field,
    true,
    true,
    candidates,
    false
);
// Process each candidate once per spell.
for (var i = 0; i < ds_list_size(candidates); i++) {
    var _unit = candidates[| i];

    if (collision_ellipse(
        _x1, _y1,
        _x2, _y2,
        _unit,
        true,
        true
    )) {
        if (!array_contains(was_hit, _unit)) {
			array_insert(was_hit,0,_unit)
			_unit.take_damage = damage
        }
    }
}

ds_list_destroy(candidates);

