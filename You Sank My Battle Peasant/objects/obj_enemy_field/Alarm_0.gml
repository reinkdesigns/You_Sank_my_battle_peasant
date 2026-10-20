 // 1. Calculate the padding (Half the sprite size + buffer)
    var _pad_x = (sprite_width / 2) + field_buffer;
    var _pad_y = (sprite_height / 2) + field_buffer;
    
    // 2. Shrink the random ranges inward so the unit can't hang out
    var _min_x = global.enemy_field.x1 + _pad_x;
    var _max_x = global.enemy_field.x2 - _pad_x;
    
    var _min_y = global.enemy_field.y1 + _pad_y;
    var _max_y = global.enemy_field.y2 - _pad_y;
    
    // 3. Pick a completely random target point inside the safe boundaries
    x = irandom_range(_min_x, _max_x);
    y = irandom_range(_min_y, _max_y);
	dest_x=x
	dest_y=y
	
	_unit = global.unit_type[monster]
	_struct_unit = global.unit[$ _unit]
	
	max_distance = _struct_unit.field_movement
	
