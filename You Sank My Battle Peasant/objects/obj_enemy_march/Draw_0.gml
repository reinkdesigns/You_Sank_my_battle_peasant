sprite_index = asset_get_index($"{global.unit[$ _unit].unit}{global.unit_animation[count]}")

if show_link && _alpha = 1 {
	draw_line_width(
		x,
		y,
		child_unit.x,
		child_unit.y,
		5)
}

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
image_xscale=_size
image_yscale=_size

if global.blind = false{
draw_text(x,y-100,global.unit_type[monster])
draw_text(x,y-75,global.unit[$ _unit].hp)
}

