sprite_index = asset_get_index($"{global.unit[$ _unit].unit}{global.unit_animation[count]}")

draw_sprite_ext(
sprite_index,
image_index,
x,y,
facing*_size,
_size,
0,
c_white,
_alpha
)

draw_text(x,y-100,global.unit_type[monster])
draw_text(x,y-75,global.unit[$ _unit].hp)

