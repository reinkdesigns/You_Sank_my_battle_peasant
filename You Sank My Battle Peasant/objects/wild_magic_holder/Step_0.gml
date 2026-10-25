tooltip_mouseover= -1

for (var i=0; i<global.world; i++){
	if point_in_rectangle(
		mouse_x,
		mouse_y,
		mouse_over_loc[i][0],
		mouse_over_loc[i][1],
		mouse_over_loc[i][2],
		mouse_over_loc[i][3]
	){
		tooltip_mouseover = i
	}
}



