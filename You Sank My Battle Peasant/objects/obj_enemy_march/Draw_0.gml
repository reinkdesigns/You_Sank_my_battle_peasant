_unit = global.unit_type[monster]

sprite_index = asset_get_index($"{global.unit[$ _unit].unit}{global.unit_animation[count]}")

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
draw_text(x,y-75,global.unit[$ _unit].hp)

draw_line(x,y,dest_x,dest_y)

with obj_player_avatar {
draw_text(x, y - 100, string(point_distance(x, y, other.x, other.y)));
draw_line(x,y,other.x,other.y)
for (var i=0;i<11;i++){
_xt = i*160

draw_text(x+_xt, y - 100, string(point_distance(x, y, other.x, other.y)-_xt));
draw_text(x+_xt, y - 50, string(x+_xt));
draw_text(x+_xt, y - 25, string(y));

}
}