// Calculate rectangle boundaries, centered on the spell.
_x1 = x - _width / 2;
_y1 = y - _height / 2;
_x2 = x + _width / 2;
_y2 = y + _height / 2;

// Find enemies overlapping the rectangle.
var candidates = ds_list_create();

var search_objects = [
	obj_enemy_field,
	obj_chest,
];

for (var j = 0; j < array_length(search_objects); j++)
{
	collision_rectangle_list(
		_x1, _y1,
		_x2, _y2,
		search_objects[j],
		true,
		true,
		candidates,
		false
	);
}

// Process candidates.
for (var i = 0; i < ds_list_size(candidates); i++)
{
	var _unit = candidates[| i];

	if (collision_ellipse(
		_x1, _y1,
		_x2, _y2,
		_unit,
		true,
		true
	))
	{
		if (!array_contains(was_hit, _unit))
		{
			array_insert(was_hit, 0, _unit);
			_unit.take_damage = damage;
		}
	}
}

ds_list_destroy(candidates);
