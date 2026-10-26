_unit = global.unit_type[monster]
_struct_unit = global.unit[$ _unit]
	var _pos = global.march_posistion
	if _struct_unit.float _pos = global.march_posistion_float
	
	x=_pos[10].x
	y=_pos[10].y

	dest_x=x
	dest_y=y
	
child_unit.monster = monster

movement = _struct_unit.march_movement
attack_range = _struct_unit.range
