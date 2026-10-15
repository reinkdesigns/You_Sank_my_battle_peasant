global.spell_field.x1 = 185
global.spell_field.y1 = 265
global.spell_field.x2 = 775
global.spell_field.y2 = 890

global.enemy_field.x1 = 1145
global.enemy_field.y1 = 265
global.enemy_field.x2 = 1735
global.enemy_field.y2 = 890

_place_magic=[]

wild = false
_wild=0
_wild_x = x
_wild_y = y

_mouse_over = (point_in_rectangle(mouse_x, mouse_y, global.spell_field.x1, global.spell_field.y1, global.spell_field.x2, global.spell_field.y2))