_unit = global.unit_type[monster]
_hp = global.unit[$ _unit].hp
_max_hp = global.unit[$ _unit].hp
_mp = global.unit[$ _unit].mp
_max_mp = global.unit[$ _unit].mp
_cast_cost_heal = global.unit[$ _unit].cast_cost_heal
_cast_cost_damage = global.unit[$ _unit].cast_cost_damage


_struct_unit = global.unit[$ _unit]
	var _pos = global.march_posistion
	if _struct_unit.float _pos = global.march_posistion_float
	
	x=_pos[10].x
	y=_pos[10].y
	
	if _size = boss_unit y -=25
	
	dest_x=x
	dest_y=y
	
child_unit.monster = monster

movement = _struct_unit.march_movement
attack_range = _struct_unit.range
