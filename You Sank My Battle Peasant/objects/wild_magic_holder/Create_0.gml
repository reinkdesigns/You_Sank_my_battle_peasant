depth = -100
loc = [
    {x: x, y: 320},
    {x: x, y: 448},
    {x: x, y: 576}
];

holder={
	x:sprite_get_width(spr_wild_magic_holder),
	y:sprite_get_height(spr_wild_magic_holder)
}
mouse_over_loc =[]
for (var i=0; i<global.world; i++){
	mouse_over_loc[i] = [
		loc[i].x-(holder.x/2),
		loc[i].y-(holder.y/2),
		loc[i].x+holder.x/2,
		loc[i].y+holder.y/2
		]
}

wm_spr = call_wild_magic()

