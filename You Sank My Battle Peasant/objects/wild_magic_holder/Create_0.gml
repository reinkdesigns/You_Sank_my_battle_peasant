_x = x
_y = y

loc = [
    {x: 960, y: 320},
    {x: 960, y: 448},
    {x: 960, y: 576}
];


global.wind_direction = irandom(7)
_sprite_name = $"spr_{global.directions[global.wind_direction]}";
_wind = asset_get_index(_sprite_name);
_wind_str = irandom(2)