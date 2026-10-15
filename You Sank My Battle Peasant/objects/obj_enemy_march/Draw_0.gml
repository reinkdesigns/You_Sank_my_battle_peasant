sprite_index = asset_get_index($"{global.unit[$ global.unit_type[monster]].unit}{global.unit_animation[count]}")

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

draw_text(x,y-100,global.unit_type[monster])

draw_line(x,y,dest_x,dest_y)