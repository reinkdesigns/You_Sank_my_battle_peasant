if (wild != 0) {
draw_rectangle(
	wild[0]-wild[2],
	wild[1]-wild[3],
	wild[0]+wild[2],
	wild[1]+wild[3],
	false)
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
