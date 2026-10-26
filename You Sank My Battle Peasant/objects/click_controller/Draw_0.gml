

	if global.spell_deck[0].type = "square" && wild !=0{
		draw_rectangle(
			wild[0]-wild[2],
			wild[1]-wild[3],
			wild[0]+wild[2],
			wild[1]+wild[3],
			false)
			draw_set_colour(c_red)
		//draw_circle(wild[0],wild[1],10,true)
		draw_set_colour(c_white)
	}
	
	if (global.spell_deck[0].type == "line") {

	    // Draw position 1 marker.
	    if (_mouse_loc[0].x != -1000) {
	        draw_circle(_mouse_loc[0].x, _mouse_loc[0].y, 5, false);
	    }

	    // Draw position 2 marker.
	    if (_mouse_loc[1].x != -1000) {
	        draw_circle(_mouse_loc[1].x, _mouse_loc[1].y, 5, false);
	    }

	    // Preview while choosing the second point.
	    if (click == 1) {
	        var _preview_direction = point_direction(
	            _mouse_loc[0].x,
	            _mouse_loc[0].y,
	            mouse_x,
	            mouse_y
	        );

	        var _preview_x = _mouse_loc[0].x
	            + lengthdir_x(global.spell_deck[0].range, _preview_direction);

	        var _preview_y = _mouse_loc[0].y
	            + lengthdir_y(global.spell_deck[0].range, _preview_direction);

	        draw_line_width(
	            _mouse_loc[0].x,
	            _mouse_loc[0].y,
	            _preview_x,
	            _preview_y,
	            global.spell_deck[0].width
	        );

	        // Show the direction point under the mouse.
	        draw_circle(mouse_x, mouse_y, 5, false);
	    }

	    // Draw the final warped line after placement.
	    if (click == 0 && wild != undefined && array_length(wild) >= 6) {
	        var _direction = point_direction(
	            wild[0],
	            wild[1],
	            wild[2],
	            wild[3]
	        );

	        var _range_x = wild[0] + lengthdir_x(wild[5], _direction);
	        var _range_y = wild[1] + lengthdir_y(wild[5], _direction);

	        draw_line_width(
	            wild[0],
	            wild[1],
	            _range_x,
	            _range_y,
	            wild[4]
	        );
	    }
	}
	
	if global.spell_deck[0].type = "AOE" && wild !=0{
		draw_ellipse(
	    wild[0] - wild[2],
	    wild[1] - wild[3],
	    wild[0] + wild[2],
	    wild[1] + wild[3],
	    false
		);

	}	




draw_rectangle(
	global.spell_field.x1,
	global.spell_field.y1,
	global.spell_field.x2,
	global.spell_field.y2,
	true)
	
draw_rectangle(
	global.enemy_field.x1,
	global.enemy_field.y1,
	global.enemy_field.x2,
	global.enemy_field.y2,
	true)


draw_text(x+100,y+100, the_march.all_busy)
