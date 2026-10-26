// Calculate rectangle boundaries, centered on the spell.
_x1 = x - _l / 2;
_y1 = y - _w / 2;
_x2 = x + _l / 2;
_y2 = y + _w / 2;

// Find enemies overlapping the rectangle.
var candidates = ds_list_create();

collision_rectangle_list(
    _x1,
    _y1,
    _x2,
    _y2,
    obj_enemy_field,
    true,
    true,
    candidates,
    false
);

// Process each candidate once per spell.
for (var i = 0; i < ds_list_size(candidates); i++) {
    var _unit = candidates[| i];

    if (_unit != noone && !array_contains(was_hit, _unit)) {
        array_insert(was_hit, 0, _unit);
        _unit.count = 2;
        _unit.parent_unit.count = 2;
    }
}

ds_list_destroy(candidates);
