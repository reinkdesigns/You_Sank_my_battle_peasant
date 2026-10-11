/*
each new world(after you beat the boss of the last world
will add a new wild magic. since wild magic exsist ontop
of the next spell queue this will also limit your future
knowledge of what spells are coming up next
*/
for (var i=0; i<array_length(loc); i++){ //change this later to global.world
draw_sprite(
sprite_index,
image_index,
loc[i].x,
loc[i].y
)
}
