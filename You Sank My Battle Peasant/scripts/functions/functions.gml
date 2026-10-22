function warp_square(_x, _y, _x_offset, _y_offset, _wild_magic, _wind_shunt = 10)
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


function warp_radius(_x, _y, _r, _wild_magic, _wind_shunt = 10)
{
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

    // Start with a circular spell.
    var _scale_x = 1;
    var _scale_y = 1;

    // Apply size effects.
    switch (_wild_magic)
    {
        case wild_magic.horz_squish:
            _scale_x = 0.5;
            break;

        case wild_magic.vert_squish:
            _scale_y = 0.5;
            break;

        case wild_magic.horz_stretch:
            _scale_x = 2;
            break;

        case wild_magic.vert_stretch:
            _scale_y = 2;
            break;

        case wild_magic.shrink:
            _scale_x = 0.5;
            _scale_y = 0.5;
            break;

        case wild_magic.enlarge:
            _scale_x = 2;
            _scale_y = 2;
            break;
    }

    // Convert center to target coordinates.
    var _result_x = global.enemy_field.x1 + _u * _target_w;
    var _result_y = global.enemy_field.y1 + _v * _target_h;

    // Convert the radius using one uniform scale factor,
    // so its size does not depend on its position.
    var _radius_scale = min(
        _target_w / _place_w,
        _target_h / _place_h
    );

    var _result_rx = _r * _radius_scale * _scale_x;
    var _result_ry = _r * _radius_scale * _scale_y;

    // Rotations swap the ellipse axes.
    if (_wild_magic == wild_magic.rotate_90
    || _wild_magic == wild_magic.rotate_270)
    {
        _temp = _result_rx;
        _result_rx = _result_ry;
        _result_ry = _temp;
    }

    // Apply wind to the center only.
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
        _result_rx,
        _result_ry
    ];
}

function warp_line(_x1, _y1, _x2, _y2, _thickness, _wild_magic, _wind_shunt = 10)
{
    var _place_w = global.spell_field.x2 - global.spell_field.x1;
    var _place_h = global.spell_field.y2 - global.spell_field.y1;
    var _target_w = global.enemy_field.x2 - global.enemy_field.x1;
    var _target_h = global.enemy_field.y2 - global.enemy_field.y1;

    // Normalize both endpoints to the spell field.
    var _u1 = (_x1 - global.spell_field.x1) / _place_w;
    var _v1 = (_y1 - global.spell_field.y1) / _place_h;
    var _u2 = (_x2 - global.spell_field.x1) / _place_w;
    var _v2 = (_y2 - global.spell_field.y1) / _place_h;

    var _temp;

    // Transform both endpoints.
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

    // Calculate the transformed center.
    var _center_u = (_u1 + _u2) * 0.5;
    var _center_v = (_v1 + _v2) * 0.5;

    // Determine axis scaling and thickness scaling.
    var _scale_x = 1;
    var _scale_y = 1;
    var _thickness_scale = 1;

    switch (_wild_magic)
    {
        case wild_magic.horz_squish:
            _scale_x = 0.5;
            _thickness_scale = 0.5;
            break;

        case wild_magic.vert_squish:
            _scale_y = 0.5;
            _thickness_scale = 0.5;
            break;

        case wild_magic.horz_stretch:
            _scale_x = 2;
            _thickness_scale = 2;
            break;

        case wild_magic.vert_stretch:
            _scale_y = 2;
            _thickness_scale = 2;
            break;

        case wild_magic.shrink:
            _scale_x = 0.5;
            _scale_y = 0.5;
            _thickness_scale = 0.5;
            break;

        case wild_magic.enlarge:
            _scale_x = 2;
            _scale_y = 2;
            _thickness_scale = 2;
            break;
    }

    // Scale each endpoint away from or toward the center.
    _u1 = _center_u + (_u1 - _center_u) * _scale_x;
    _v1 = _center_v + (_v1 - _center_v) * _scale_y;

    _u2 = _center_u + (_u2 - _center_u) * _scale_x;
    _v2 = _center_v + (_v2 - _center_v) * _scale_y;

    // Convert endpoints to target field coordinates.
    var _result_x1 = global.enemy_field.x1 + _u1 * _target_w;
    var _result_y1 = global.enemy_field.y1 + _v1 * _target_h;
    var _result_x2 = global.enemy_field.x1 + _u2 * _target_w;
    var _result_y2 = global.enemy_field.y1 + _v2 * _target_h;

    // Scale line thickness.
    var _result_thickness = _thickness * _thickness_scale;

    // Apply wind equally to both endpoints.
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
        _result_thickness
    ];
}


function summon_unit(_unit){
var _peasant = instance_create_layer(x,y,"March",obj_enemy_march)
_peasant.monster = _unit
}

function report_message(_txt,type=0){
if type show_debug_message(_txt)
else show_message(_txt)

}