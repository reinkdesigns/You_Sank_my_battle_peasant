sprite_index = asset_get_index($"{_struct_unit.unit}{global.unit_animation[count]}")

draw_sprite_ext(
sprite_index,
image_index,
x,y,
facing*_size,
_size,
0,
c_white,
1
)

