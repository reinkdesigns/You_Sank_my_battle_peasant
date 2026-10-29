#macro base_wind_str 25
#macro reduce 0.75
#macro increase 1.25

function cast_square(_x, _y, _x_offset, _y_offset)
{
    var loc = [_x, _y, _x_offset, _y_offset];

    for (var i = 0; i < global.world; i++)
    {
        var _final = (i == global.world - 1);

        loc = warp_square(
            loc[0], //x
            loc[1], //y
            loc[2], //half length
            loc[3], //half width
            global.wild_magic[i],
            _final
        );
    }

	the_march.step=1//march()
	ruler_controller.mark=[]
    return loc;
}

function warp_square(
						_x,
						_y,
						_x_offset,
						_y_offset,
						_wild_magic,
						_final = true,
						_wind_shunt = global.w_str){
							
    var _place_w = global.spell_field.x2 - global.spell_field.x1;
    var _place_h = global.spell_field.y2 - global.spell_field.y1;
    var _target_w = global.enemy_field.x2 - global.enemy_field.x1;
    var _target_h = global.enemy_field.y2 - global.enemy_field.y1;

    // Normalize center coordinates.
    var _u = (_x - global.spell_field.x1) / _place_w;
    var _v = (_y - global.spell_field.y1) / _place_h;

    // Keep offsets in spell-field units.
    var _uw = _x_offset;
    var _vh = _y_offset;

    var _temp;

    // Transform center.
    switch (_wild_magic)
    {
        case wild_magic.horz_mirror:
            _u = 1 - _u;
            break;

        case wild_magic.vert_mirror:
            _v = 1 - _v;
            break;

        case wild_magic.rotate_90:
            _temp = _u;
            _u = 1 - _v;
            _v = _temp;

            _temp = _uw;
            _uw = _vh;
            _vh = _temp;
            break;

        case wild_magic.rotate_180:
            _u = 1 - _u;
            _v = 1 - _v;
            break;

        case wild_magic.rotate_270:
            _temp = _u;
            _u = _v;
            _v = 1 - _temp;

            _temp = _uw;
            _uw = _vh;
            _vh = _temp;
            break;
    }

    // Apply size effects to the existing offsets.
    switch (_wild_magic)
    {
        case wild_magic.horz_squish:
            _uw *= reduce;
            break;

        case wild_magic.vert_squish:
            _vh *= reduce;
            break;

        case wild_magic.horz_stretch:
            _uw *= increase;
            break;

        case wild_magic.vert_stretch:
            _vh *= increase;
            break;

        case wild_magic.shrink:
            _uw *= reduce;
            _vh *= reduce;
            break;

        case wild_magic.enlarge:
            _uw *= increase;
            _vh *= increase;
            break;
    }

    var _result_x;
    var _result_y;
    var _result_x_offset;
    var _result_y_offset;

    if (_final)
    {
        // Final pass: map center and offsets to enemy-field coordinates.
        _result_x = global.enemy_field.x1 + _u * _target_w;
        _result_y = global.enemy_field.y1 + _v * _target_h;

        _result_x_offset = _uw * (_target_w / _place_w);
        _result_y_offset = _vh * (_target_h / _place_h);
    }
    else
    {
        // Intermediate pass: remain in spell-field coordinates.
        _result_x = global.spell_field.x1 + _u * _place_w;
        _result_y = global.spell_field.y1 + _v * _place_h;

        _result_x_offset = _uw;
        _result_y_offset = _vh;
    }
	if _wild_magic mod 2 == 0 _wind_shunt= _wind_shunt*diag_mod //if wild magic is even, if its a wind the wind is a diagonal movement, so reduce it by diagmod
    // Apply wind to the center.
    switch (_wild_magic)
    {
        case wild_magic.wind_N:
            _result_y -= _wind_shunt;
            break;

        case wild_magic.wind_NE:
            _result_x += _wind_shunt;
            _result_y -= _wind_shunt;
            break;

        case wild_magic.wind_E:
            _result_x += _wind_shunt;
            break;

        case wild_magic.wind_SE:
            _result_x += _wind_shunt;
            _result_y += _wind_shunt;
            break;

        case wild_magic.wind_S:
            _result_y += _wind_shunt;
            break;

        case wild_magic.wind_SW:
            _result_x -= _wind_shunt;
            _result_y += _wind_shunt;
            break;

        case wild_magic.wind_W:
            _result_x -= _wind_shunt;
            break;

        case wild_magic.wind_NW:
            _result_x -= _wind_shunt;
            _result_y -= _wind_shunt;
            break;
    }

    return [
        _result_x,
        _result_y,
        _result_x_offset,
        _result_y_offset
    ];
}


function cast_radius(_x, _y, _r)
{
    var loc = [_x, _y, _r, _r];

    for (var i = 0; i < global.world; i++)
    {
        var _final = (i == global.world - 1);

        loc = warp_radius(
            loc[0],
            loc[1],
            loc[2],
            loc[3],
            global.wild_magic[i],
            _final
        );

    }
	ruler_controller.mark=[]
	the_march.step=1//march()
    return loc;
}

function warp_radius(	
					_x,
					_y,
					_r1,
					_r2,
					_wild_magic,
					_final = true,
					_wind_shunt = global.w_str){
						
    var _place_w = global.spell_field.x2 - global.spell_field.x1;
    var _place_h = global.spell_field.y2 - global.spell_field.y1;
    var _target_w = global.enemy_field.x2 - global.enemy_field.x1;
    var _target_h = global.enemy_field.y2 - global.enemy_field.y1;

    // Normalize center within the spell field.
    var _u = (_x - global.spell_field.x1) / _place_w;
    var _v = (_y - global.spell_field.y1) / _place_h;

    var _temp;

    // Transform center.
    switch (_wild_magic)
    {
        case wild_magic.horz_mirror:
            _u = 1 - _u;
            break;

        case wild_magic.vert_mirror:
            _v = 1 - _v;
            break;

        case wild_magic.rotate_90:
            _temp = _u;
            _u = 1 - _v;
            _v = _temp;
            break;

        case wild_magic.rotate_180:
            _u = 1 - _u;
            _v = 1 - _v;
            break;

        case wild_magic.rotate_270:
            _temp = _u;
            _u = _v;
            _v = 1 - _temp;
            break;
    }

    // Determine ellipse scaling.
    var _scale_x = 1;
    var _scale_y = 1;

    switch (_wild_magic)
    {
        case wild_magic.horz_squish:
            _scale_y = reduce;
            break;

        case wild_magic.vert_squish:
            _scale_x = reduce;
            break;

        case wild_magic.horz_stretch:
            _scale_y = increase;
            break;

        case wild_magic.vert_stretch:
            _scale_x = increase;
            break;

        case wild_magic.shrink:
            _scale_x = reduce;
            _scale_y = reduce;
            break;

        case wild_magic.enlarge:
            _scale_x = increase;
            _scale_y = increase;
            break;
    }

    // Apply size effects to the existing radii.
    var _result_r1 = _r1 * _scale_x;
    var _result_r2 = _r2 * _scale_y;

    // Rotate the ellipse's axes.
    if (_wild_magic == wild_magic.rotate_90
    || _wild_magic == wild_magic.rotate_270)
    {
        _temp = _result_r1;
        _result_r1 = _result_r2;
        _result_r2 = _temp;
    }

    var _result_x;
    var _result_y;

    if (_final)
    {
        // Final pass: map the center to the enemy field.
        _result_x = global.enemy_field.x1 + _u * _target_w;
        _result_y = global.enemy_field.y1 + _v * _target_h;
    }
    else
    {
        // Intermediate pass: keep the center in the spell field.
        _result_x = global.spell_field.x1 + _u * _place_w;
        _result_y = global.spell_field.y1 + _v * _place_h;
    }
	if _wild_magic mod 2 == 0 _wind_shunt= _wind_shunt*diag_mod //if wild magic is even, if its a wind the wind is a diagonal movement, so reduce it by diagmod
    // Apply wind to the center.
    switch (_wild_magic)
    {
        case wild_magic.wind_N:
            _result_y -= _wind_shunt;
            break;

        case wild_magic.wind_NE:
            _result_x += _wind_shunt;
            _result_y -= _wind_shunt;
            break;

        case wild_magic.wind_E:
            _result_x += _wind_shunt;
            break;

        case wild_magic.wind_SE:
            _result_x += _wind_shunt;
            _result_y += _wind_shunt;
            break;

        case wild_magic.wind_S:
            _result_y += _wind_shunt;
            break;

        case wild_magic.wind_SW:
            _result_x -= _wind_shunt;
            _result_y += _wind_shunt;
            break;

        case wild_magic.wind_W:
            _result_x -= _wind_shunt;
            break;

        case wild_magic.wind_NW:
            _result_x -= _wind_shunt;
            _result_y -= _wind_shunt;
            break;
    }

    return [
        _result_x,
        _result_y,
        _result_r1,
        _result_r2
    ];
}


function cast_line(_x1, _y1, _x2, _y2, _thickness, _range)
{
    var loc = [_x1, _y1, _x2, _y2, _thickness, _range];

    for (var i = 0; i < global.world; i++)
    {
        var _final = (i == global.world - 1);

        loc = warp_line(
            loc[0],
            loc[1],
            loc[2],
            loc[3],
            loc[4],
            loc[5],
            global.wild_magic[i],
            _final
        );
    }
	ruler_controller.mark=[]
	the_march.step=1//march()
    return loc;
}

function warp_line(
				_x1,
				_y1,
				_x2,
				_y2,
				_thickness,
				_range,
				_wild_magic,
				_final = true, _wind_shunt = global.w_str){
					
    var _place_w = global.spell_field.x2 - global.spell_field.x1;
    var _place_h = global.spell_field.y2 - global.spell_field.y1;
    var _target_w = global.enemy_field.x2 - global.enemy_field.x1;
    var _target_h = global.enemy_field.y2 - global.enemy_field.y1;

    // Normalize endpoints to the spell field.
    var _u1 = (_x1 - global.spell_field.x1) / _place_w;
    var _v1 = (_y1 - global.spell_field.y1) / _place_h;
    var _u2 = (_x2 - global.spell_field.x1) / _place_w;
    var _v2 = (_y2 - global.spell_field.y1) / _place_h;

    var _temp;

    // Transform endpoints.
    switch (_wild_magic)
    {
        case wild_magic.horz_mirror:
            _u1 = 1 - _u1;
            _u2 = 1 - _u2;
            break;

        case wild_magic.vert_mirror:
            _v1 = 1 - _v1;
            _v2 = 1 - _v2;
            break;

        case wild_magic.rotate_90:
            _temp = _u1;
            _u1 = 1 - _v1;
            _v1 = _temp;

            _temp = _u2;
            _u2 = 1 - _v2;
            _v2 = _temp;
            break;

        case wild_magic.rotate_180:
            _u1 = 1 - _u1;
            _v1 = 1 - _v1;
            _u2 = 1 - _u2;
            _v2 = 1 - _v2;
            break;

        case wild_magic.rotate_270:
            _temp = _u1;
            _u1 = _v1;
            _v1 = 1 - _temp;

            _temp = _u2;
            _u2 = _v2;
            _v2 = 1 - _temp;
            break;
    }

    // Calculate transformed center.
    var _center_u = (_u1 + _u2) * reduce;
    var _center_v = (_v1 + _v2) * reduce;

    var _scale_x = 1;
    var _scale_y = 1;
    var _thickness_scale = 1;
    var _range_scale = 1;

    switch (_wild_magic)
    {
        case wild_magic.horz_squish:
            _scale_x = reduce;
            _thickness_scale = reduce;
            break;

        case wild_magic.vert_squish:
            _scale_y = reduce;
            _range_scale = reduce;
            break;

        case wild_magic.horz_stretch:
            _scale_x = increase;
            _thickness_scale = increase;
            break;

        case wild_magic.vert_stretch:
            _scale_y = increase;
            _range_scale = increase;
            break;

        case wild_magic.shrink:
            _scale_x = reduce;
            _scale_y = reduce;
            _thickness_scale = reduce;
            _range_scale = reduce;
            break;

        case wild_magic.enlarge:
            _scale_x = increase;
            _scale_y = increase;
            _thickness_scale = increase;
            _range_scale = increase;
            break;
    }

    // Scale endpoints around the center.
    _u1 = _center_u + (_u1 - _center_u) * _scale_x;
    _v1 = _center_v + (_v1 - _center_v) * _scale_y;
    _u2 = _center_u + (_u2 - _center_u) * _scale_x;
    _v2 = _center_v + (_v2 - _center_v) * _scale_y;

    var _result_x1;
    var _result_y1;
    var _result_x2;
    var _result_y2;

    if (_final)
    {
        // Final pass: map endpoints to enemy field.
        _result_x1 = global.enemy_field.x1 + _u1 * _target_w;
        _result_y1 = global.enemy_field.y1 + _v1 * _target_h;
        _result_x2 = global.enemy_field.x1 + _u2 * _target_w;
        _result_y2 = global.enemy_field.y1 + _v2 * _target_h;
    }
    else
    {
        // Intermediate pass: keep endpoints in spell field.
        _result_x1 = global.spell_field.x1 + _u1 * _place_w;
        _result_y1 = global.spell_field.y1 + _v1 * _place_h;
        _result_x2 = global.spell_field.x1 + _u2 * _place_w;
        _result_y2 = global.spell_field.y1 + _v2 * _place_h;
    }

    var _result_thickness = _thickness * _thickness_scale;
    var _result_range = _range * _range_scale;
	if _wild_magic mod 2 == 0 _wind_shunt= _wind_shunt*diag_mod //if wild magic is even, if its a wind the wind is a diagonal movement, so reduce it by diagmod
    // Apply wind to both endpoints.
    switch (_wild_magic)
    {
        case wild_magic.wind_N:
            _result_y1 -= _wind_shunt;
            _result_y2 -= _wind_shunt;
            break;

        case wild_magic.wind_NE:
            _result_x1 += _wind_shunt;
            _result_y1 -= _wind_shunt;
            _result_x2 += _wind_shunt;
            _result_y2 -= _wind_shunt;
            break;

        case wild_magic.wind_E:
            _result_x1 += _wind_shunt;
            _result_x2 += _wind_shunt;
            break;

        case wild_magic.wind_SE:
            _result_x1 += _wind_shunt;
            _result_y1 += _wind_shunt;
            _result_x2 += _wind_shunt;
            _result_y2 += _wind_shunt;
            break;

        case wild_magic.wind_S:
            _result_y1 += _wind_shunt;
            _result_y2 += _wind_shunt;
            break;

        case wild_magic.wind_SW:
            _result_x1 -= _wind_shunt;
            _result_y1 += _wind_shunt;
            _result_x2 -= _wind_shunt;
            _result_y2 += _wind_shunt;
            break;

        case wild_magic.wind_W:
            _result_x1 -= _wind_shunt;
            _result_x2 -= _wind_shunt;
            break;

        case wild_magic.wind_NW:
            _result_x1 -= _wind_shunt;
            _result_y1 -= _wind_shunt;
            _result_x2 -= _wind_shunt;
            _result_y2 -= _wind_shunt;
            break;
    }

    return [
        _result_x1,
        _result_y1,
        _result_x2,
        _result_y2,
        _result_thickness,
        _result_range
    ];
}

function line_attack_hits(_x1, _y1, _x2, _y2, _thickness, _units)
{
    var _hits = ds_list_create();

    var _dx = _x2 - _x1;
    var _dy = _y2 - _y1;
    var _length_sq = _dx * _dx + _dy * _dy;

    var _count = ds_list_size(_units);

    for (var i = 0; i < _count; i++)
    {
        var _unit = _units[| i];

        if (!instance_exists(_unit))
            continue;

        var _ux = _unit.x - _x1;
        var _uy = _unit.y - _y1;

        var _t = 0;

        if (_length_sq > 0)
        {
            _t = clamp(
                (_ux * _dx + _uy * _dy) / _length_sq,
                0,
                1
            );
        }

        var _closest_x = _x1 + _t * _dx;
        var _closest_y = _y1 + _t * _dy;

        var _dist_x = _unit.x - _closest_x;
        var _dist_y = _unit.y - _closest_y;

        if (_dist_x * _dist_x + _dist_y * _dist_y
            <= _thickness * _thickness)
        {
            ds_list_add(_hits, _unit);
        }
    }

    return _hits;
}

function summon_unit(_unit){
var _peasant = instance_create_layer(x,y,"March",obj_enemy_march)
_peasant.monster = _unit
}

function report_message(_txt,type=0){
if type show_debug_message(_txt)
else show_message(_txt)

}
global.skip_cast = false
function next_spell_reload(){
	
	if (global.skip_cast) global.skip_cast = false else array_shift(global.spell_deck)
	if array_length(global.spell_deck)=0{
		create_new_deck()
		the_march.step = 1
		global.skip_cast = true
	}
	global.next_spell_Type = global.spell_deck[0].type
}

function call_wild_magic()
{
	
	var _wind_str = irandom(2)
	global.w_str = (_wind_str+1)*base_wind_str
	var _wind_direction = irandom(7)
	
    var _magic = [];
    var blind_pick = false;
	global.blind = false

    var _mirror = [
        wild_magic.horz_mirror,
        wild_magic.vert_mirror
    ];
	
	var _mirror_spr = [
        horz_mirror,
        vert_mirror
    ];

    var _rotate = [
        wild_magic.rotate_90,
        wild_magic.rotate_180,
        wild_magic.rotate_270
    ];
	
	var _rotate_spr = [
        rotate_90_R,
        rotate_180,
        rotate_90_L
    ];

    var _squish = [
        wild_magic.horz_squish,
        wild_magic.vert_squish,
        wild_magic.shrink
    ];

    var _squish_spr = [
        horz_squish,
        vert_squish,
        shrink
    ];

    var _stretch = [
        wild_magic.horz_stretch,
        wild_magic.vert_stretch,
        wild_magic.enlarge
    ];
	
	    var _stretch_spr = [
        horz_stretch,
        vert_stretch,
        enlarge
    ];

    var _wind = [
        wild_magic.wind_N,
        wild_magic.wind_NE,
        wild_magic.wind_E,
        wild_magic.wind_SE,
        wild_magic.wind_S,
        wild_magic.wind_SW,
        wild_magic.wind_W,
        wild_magic.wind_NW
    ];
	
	    var _wind_dir_text = [
        "Northern",
        "North Eastern",
        "Eastern",
        "South Eastern",
        "Southern",
        "South Western",
        "Western",
        "North Western"
    ];
	global.w_dir = _wind_dir_text[_wind_direction]
	set_global_tooltip()
    for (var i = 0; i < global.world; i++)
    {
        var _type = irandom(magic_types.COUNT - 1);

        // Allow blind only once.
        if (_type == magic_types.blind)
        {
			//weight down
			if irandom(1) _type = irandom(magic_types.COUNT - 1); //makes blind show up less
            if (blind_pick)
            {
                while (_type == magic_types.blind)
                {
                    _type = irandom(magic_types.COUNT - 1);
                }
            }
            else
            {
                blind_pick = true;
            }
        }
		var _ran = 0
		global.wild_magic[i]=0
        switch (_type)
        {
            case magic_types.none:
                _magic[i] = [wild_magic.no_effect,null_magic,0,global.tooltip.null_magic]; //change sprite
                break;

            case magic_types.blind:
                _magic[i] = [wild_magic.blind,blind,0,global.tooltip.blind];
				global.blind = true
				global.wild_magic[i]=1
                break;

            case magic_types.mirror:
				_ran = irandom(array_length(_mirror) - 1)
				_magic[i] = [
				    _mirror[_ran],
				    _mirror_spr[_ran],
				    0,
				    global.tooltip[$ sprite_get_name(_mirror_spr[_ran])]
				];
				global.wild_magic[i]=_mirror[_ran]
                break;

            case magic_types.rotate:
				_ran = irandom(array_length(_rotate) - 1)
                _magic[i] = [
				    _rotate[_ran],
				    _rotate_spr[_ran],
				    0,
				    global.tooltip[$ sprite_get_name(_rotate_spr[_ran])]
				];
				global.wild_magic[i]=_rotate[_ran]
                break;

            case magic_types.squish:
				_ran = irandom(array_length(_squish) - 1)
				_magic[i] = [
				    _squish[_ran],
				    _squish_spr[_ran],
				    0,
				    global.tooltip[$ sprite_get_name(_squish_spr[_ran])]
				];
				global.wild_magic[i]=_squish[_ran]
                break;

            case magic_types.stretch:
				_ran = irandom(array_length(_stretch) - 1)
				_magic[i] = [
				    _stretch[_ran],
				    _stretch_spr[_ran],
				    0,
				    global.tooltip[$ sprite_get_name(_stretch_spr[_ran])]
				];
				global.wild_magic[i]=_stretch[_ran]
                break;

            case magic_types.wind:
				var _sprite_name = $"spr_{global.directions[_wind_direction]}";
				var _wind_spr = asset_get_index(_sprite_name);
                _magic[i] = [
					_wind[_wind_direction],
					_wind_spr,_wind_str,
					global.tooltip.wind
				];
				global.wild_magic[i]=_wind[_wind_direction] //might need to deconstruct
                break;
        }
    }
    return _magic;
}



