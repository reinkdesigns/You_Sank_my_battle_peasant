sprite_index = asset_get_index($"{_struct_unit.unit}{global.unit_animation[count]}")

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
if global._ping_alpha >.96  {
	_ping_x=x-global_x
	_ping_y=y
}
draw_set_alpha(global._ping_alpha)
draw_set_colour(c_red)

draw_circle(_ping_x,_ping_y,5,false)
draw_set_colour(c_white)
draw_set_alpha(1)

