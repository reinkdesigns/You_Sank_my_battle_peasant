#macro field_buffer 5
#macro boss_unit 5
#macro normal_unit 2

x=10000
y=-1000
monster = 0
_unit = global.unit_type[monster]
_struct_unit = global.unit[$ _unit]
_hp = 10
_max_hp=10
_mp = 0
_max_mp = 0
_dead = false
_rank = 1
_x=x
_x_last = _x
_y = y
_y_last = _y

show_link = false

movement = 0
_start_speed = 5
attack_range = 3

_speed = _start_speed
_size = normal_unit
busy = false
m_pos=10

facing=-1

count = 0
last_count = 0

image_speed = .5
dest_x=x
dest_y=y

_alpha = 0

child_unit = instance_create_layer(10000,10000,"Unit_Field",obj_enemy_field)

child_unit.parent_unit = id
child_unit.image_speed = image_speed

march = function()
{
	child_unit.march()
	var _pos = global.march_posistion;

	if (_struct_unit.float)
		_pos = global.march_posistion_float;

	// Start at the desired landing position.
	var _target = m_pos - movement;

	// Clamp to the valid range.
	_target = max(1, _target);
	var _boss_mod =_size==boss_unit ? -25:0


	// Find the correct unit type to check for occupancy.
	var _occupied_object = obj_enemy_march;

	// Search from the desired position toward position 1.
	while (_target < m_pos)
	{
		var _occupied = instance_position(
			_pos[_target].x,
			_pos[_target].y+_boss_mod,
			_occupied_object
		);

		// Ignore this unit itself.
		if (_occupied == id)
		{
			_target++;
			continue;
		}

		// If occupied by another unit, try a closer position.
		if (instance_exists(_occupied))
		{
			_target++;
			continue;
		}

		// Found an available position.
		break;
	}

	// Only move if a valid position was found.
	if (_target < m_pos)
	{
		m_pos = _target;
		dest_x = _pos[m_pos].x;
		dest_y = _pos[m_pos].y+_boss_mod;
	}
}
attack = function(){
	var can_attack = true
	if _struct_unit.is_healer{
		var _heal_target = [];

		with (obj_enemy_march) if other != self array_push(_heal_target, id);

		var target_hp = [];

		for (var i = 0; i < array_length(_heal_target); i++) {
			var _unit = _heal_target[i];

			if (_unit._hp >= _unit._max_hp)
				continue;

			array_push(target_hp, {
			    id: _unit,
			    hp: _unit._hp
			});

			array_sort(target_hp, function(a, b) {
			    return a.hp - b.hp;
			});
		}

				// Sort by missing HP, highest to lowest
				if array_length(target_hp) > 0 {
					var _target = target_hp[0].id;

					if	_struct_unit.heal_type == "holy"&&
						_mp>=_cast_cost_heal{
							_mp -= _cast_cost_heal
							var heal_amount = ceil(_target._max_hp*.05*_rank)
							_target._hp = min(_target._hp + heal_amount, _target._max_hp);
							can_attack = false;
							count = 5;
							image_index = 0
					}

					if	_struct_unit.heal_type == "blood" &&
						_hp > 15 &&
						_target._hp < _target._max_hp / 2 {
							_hp -= 15;
							var heal_amount = ceil(_target._max_hp*.1*_rank)
							_target._hp = min(_target._hp + heal_amount, _target._max_hp);
							can_attack = false;
							count = 5;
							image_index = 0
					}
				}
			}
		
		if m_pos<= attack_range && can_attack == true{
		count = 4
		image_index = 0
		//do attack stuff
		}
	}





alarm_set(0,1)