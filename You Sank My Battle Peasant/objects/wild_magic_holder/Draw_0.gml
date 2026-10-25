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

draw_rectangle(
	loc[i].x-(holder.x/2),
	loc[i].y-(holder.y/2),
	loc[i].x+holder.x/2,
	loc[i].y+holder.y/2,
	true
	)

}


if tooltip_mouseover != -1 {
	
	tooltip_text = wm_spr[tooltip_mouseover][3]


	var _longest = "";
	var _longest_length = 0;

	var _lines = array_length(tooltip_text)

	for (var i = 0; i < _lines; i++)
	{
	    var _len = string_width(tooltip_text[i]);
		_longest_length = max(_longest_length,_len)
	}

	var _y_text = 0
	for (var i = 0; i<_lines; i++){
		if i != 1
		draw_text(
			mouse_x+(_longest_length/2) + 50,
			mouse_y+_y_text,
			tooltip_text[i]
		)
		_y_text+=20


	}
}


