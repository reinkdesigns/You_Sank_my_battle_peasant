_x = x
_y = y

loc = [
    {x: 960, y: 320},
    {x: 960, y: 448},
    {x: 960, y: 576}
];


wm_spr = call_wild_magic()


function call_wild_magic()
{
	var _wind_str = irandom(2)
	var _wind_direction = irandom(7)
	
    var _magic = [];
    var blind_pick = false;

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

    for (var i = 0; i < global.world; i++)
    {
        var _type = irandom(magic_types.COUNT - 1);

        // Allow blind only once.
        if (_type == magic_types.blind)
        {
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
        switch (_type)
        {
            case magic_types.none:
                _magic[i] = [wild_magic.no_effect,spr_wild_magic_holder,0]; //change sprite
                break;

            case magic_types.blind:
                _magic[i] = [wild_magic.blind,spr_wild_magic_holder,0];
                break;

            case magic_types.mirror:
				_ran = irandom(array_length(_mirror) - 1)
                _magic[i] = [_mirror[_ran],_mirror_spr[_ran],0];
                break;

            case magic_types.rotate:
				_ran = irandom(array_length(_rotate) - 1)
                _magic[i] = [_rotate[_ran],_rotate_spr[_ran],0];
                break;

            case magic_types.squish:
				_ran = irandom(array_length(_squish) - 1)
                _magic[i] = [_squish[_ran],_squish_spr[_ran],0];
                break;

            case magic_types.stretch:
				_ran = irandom(array_length(_stretch) - 1)
                _magic[i] = [_stretch[_ran],_stretch_spr[_ran],0];
                break;

            case magic_types.wind:
				var _sprite_name = $"spr_{global.directions[_wind_direction]}";
				var _wind_spr = asset_get_index(_sprite_name);
                _magic[i] = [_wind[_wind_direction],_wind_spr,_wind_str];
                break;
        }
    }

    return _magic;
}