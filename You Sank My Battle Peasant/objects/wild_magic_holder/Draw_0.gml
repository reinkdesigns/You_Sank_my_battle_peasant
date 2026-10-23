/*
each new world(after you beat the boss of the last world
will add a new wild magic. since wild magic exsist ontop
of the next spell queue this will also limit your future
knowledge of what spells are coming up next
*/
for (var i=0; i<global.world; i++){ //change this later to global.world
//underlay
draw_sprite(
sprite_index,
image_index,
loc[i].x,
loc[i].y
)



//overlay

draw_sprite_ext(
wm_spr[i][1],
wm_spr[i][2],
loc[i].x,
loc[i].y,
1.2,
1.2,
0,
c_white,
1
)

//overlay
draw_sprite(
border_normal,
image_index,
loc[i].x,
loc[i].y
)


}
