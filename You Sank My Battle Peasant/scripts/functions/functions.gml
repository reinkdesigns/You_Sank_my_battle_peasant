function warp_placement(_x, _y, _x_offset, _y_offset, _wild_magic, _wind_shunt = 10)
{

    var _place_w = global.spell_field.x2 - global.spell_field.x1;
    var _place_h = global.spell_field.y2 - global.spell_field.y1;
    var _target_w = global.enemy_field.x2 - global.enemy_field.x1;
    var _target_h = global.enemy_field.y2 - global.enemy_field.y1;

    // Normalize center coordinates
    var _u = (_x - global.spell_field.x1) / _place_w;
    var _v = (_y - global.spell_field.y1) / _place_h;

    // Normalize spell offsets
    var _uw = _x_offset / _place_w;
    var _vh = _y_offset / _place_h;

    var _temp;

    // Transform spell center
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

    // Transform spell size around its center
    switch (_wild_magic)
    {
        case wild_magic.horz_squish:
            _uw *= 0.5;
            break;

        case wild_magic.vert_squish:
            _vh *= 0.5;
            break;

        case wild_magic.horz_stretch:
            _uw *= 2;
            break;

        case wild_magic.vert_stretch:
            _vh *= 2;
            break;

        case wild_magic.shrink:
            _uw *= 0.5;
            _vh *= 0.5;
            break;

        case wild_magic.enlarge:
            _uw *= 2;
            _vh *= 2;
            break;
    }

    // Convert center to target coordinates
    var _result_x = global.enemy_field.x1 + _u * _target_w;
    var _result_y = global.enemy_field.y1 + _v * _target_h;

    // Convert offsets to target dimensions
    var _result_x_offset = _uw * _target_w;
    var _result_y_offset = _vh * _target_h;

    // Apply wind to the spell center
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

function report_message(_txt,type=0){
if type show_debug_message(_txt)
else show_message(_txt)

}