if(global.debug){
var _wind = (global.w_str)
draw_circle(mouse_x,mouse_y,_wind,true)
draw_set_colour(c_red)

draw_text(
	mouse_x + _wind*0,
	mouse_y + _wind*-1 ,
	"N")	

draw_text(
	mouse_x + _wind*1,
	mouse_y + _wind*0 ,
	"E")
	

draw_text(
	mouse_x + _wind*0,
	mouse_y + _wind*1 ,
	"S")	
	
draw_text(
	mouse_x + _wind*-1,
	mouse_y + _wind*0 ,
	"W")	

_wind = _wind*diag_mod
	
draw_text(
	mouse_x + _wind*1,
	mouse_y + _wind*-1 ,
	"NE")	
	
draw_text(
	mouse_x + _wind*1,
	mouse_y + _wind*1 ,
	"SE")
	
draw_text(
	mouse_x + _wind*-1,
	mouse_y + _wind*1 ,
	"SW")
		
draw_text(
	mouse_x + _wind*-1,
	mouse_y + _wind*-1 ,
	"NW")
	

draw_set_colour(c_white)	
}


	for (var i=0; i<array_length(mark);i++){
		draw_circle(
			mark[i][0],
			mark[i][1],
			5,
			false
			)
	}



if (measuring) {
    // Draw the ruler line
    draw_set_color(c_white);
    draw_line_width(start_x, start_y, end_x, end_y, 2);

    // Calculate the center of the line
    var _mid_x = (start_x + end_x) * 0.5;
    var _mid_y = (start_y + end_y) * 0.5;

    // Draw the distance at the center


    draw_text(
        _mid_x,
        _mid_y - 12,
        string(round(distance))
    );

    // Reset drawing alignment

}


	
	
	
	
	
	
	
	
	
	
	
	
	
	