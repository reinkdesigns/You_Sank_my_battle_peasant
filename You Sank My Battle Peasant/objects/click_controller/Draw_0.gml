
if (wild != 0) {

	if spelltype = spellshape.square{
		draw_rectangle(
			wild[0]-wild[2],
			wild[1]-wild[3],
			wild[0]+wild[2],
			wild[1]+wild[3],
			false)
	}
	
	if spelltype = spellshape.line{
		
		if _mouse_loc[0].x != -1000
			draw_circle(_mouse_loc[0].x,_mouse_loc[0].y,5,false)
		if _mouse_loc[1].x != -1000
			draw_circle(_mouse_loc[1].x,_mouse_loc[1].y,5,false)
		
		if _mouse_loc[0].x != -1000 && _mouse_loc[1].x == -1000
			draw_line_width(
				mouse_x,
				mouse_y,
				_mouse_loc[0].x,
				_mouse_loc[0].y,
				3)
				
		if _mouse_loc[0].x != -1000 && _mouse_loc[1].x != -1000
			draw_line_width(
				_mouse_loc[0].x,
				_mouse_loc[0].y,
				_mouse_loc[1].x,
				_mouse_loc[1].y,
				3)
		
		draw_line_width(
		    wild[0],
		    wild[1],
		    wild[2],
		    wild[3],
		    wild[4]
		);
	}
	
	if spelltype = spellshape.radius{
		draw_ellipse(
	    wild[0] - wild[2],
	    wild[1] - wild[3],
	    wild[0] + wild[2],
	    wild[1] + wild[3],
	    false
		);
	}	
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
