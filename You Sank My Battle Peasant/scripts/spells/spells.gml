

set_spells()
global.base_deck = [
global.spell.line_spell,
global.spell.line_spell,
global.spell.line_spell,
global.spell.line_spell,
global.spell.line_spell,
global.spell.line_spell,
//global.spell.small_square_spell,
//global.spell.small_AOE_spell,
//global.spell.large_AOE_spell,
////global.spell.summon_spell,
//global.spell.large_square_spell
]

global.rm_layer = "Unit_Field"


global.spell_deck = []
create_new_deck()
function create_new_deck(){
	
global.spell_deck=variable_clone(global.base_deck)
global.spell_deck = array_shuffle(global.spell_deck);

}

global.next_spell_Type = global.spell_deck[0].type

function set_spells() {
	global.spell = {
		line_spell : {
			type	: "line",
			damage	: 50,
			range	: 100,
			width	: 20,
			speed	: 5,
			run_spell : function(wild){
				
				
				var _direction = point_direction(
	            wild[0],
	            wild[1],
	            wild[2],
	            wild[3]
	        );

	        var _range_x = wild[0] + lengthdir_x(wild[5], _direction);
	        var _range_y = wild[1] + lengthdir_y(wild[5], _direction);
			
			var spell_unit = instance_create_layer(wild[0],wild[1], global.rm_layer, obj_circle_spell)
			spell_unit._r1=wild[4]/2
			spell_unit._r2=wild[4]/2
			
			spell_unit.move_speed=min(self.speed,wild[4])
			spell_unit.die_on_move=true
			spell_unit.damage=self.damage

			spell_unit.target_x=_range_x
			spell_unit.target_y=_range_y

			spell_unit.alarm[0]=100
			}
		},
	
		small_AOE_spell : {
			type	: "AOE",
			damage	: 50,
			radius	: 5,
			run_spell : function(wild){//create spell object at location and give it a radius
				var spell_unit = instance_create_layer(wild[0],wild[1], global.rm_layer, obj_circle_spell)
				spell_unit._r1=wild[2]
				spell_unit._r2=wild[3]
				spell_unit.damage=self.damage
				spell_unit.alarm[0]=100
			}
			},	

		large_AOE_spell : {
			type	: "AOE",
			damage	: 50,
			radius	: 100,
			run_spell : function(wild){//create spell object at location and give it a radius
				var spell_unit = instance_create_layer(wild[0],wild[1], global.rm_layer, obj_circle_spell)
				spell_unit._r1=wild[2]
				spell_unit._r2=wild[3]
				spell_unit.damage=self.damage
				spell_unit.alarm[0]=100
			}
			},
	
		summon_spell : {
			type	: "freecast",
			damage	: 50,
			range	: 0,
			run_spell : function(targets){
				var target_loc=[{}]
				for (var i =0;i<targets;i++){
				    var _pad = 10
    
				    var _min_x = global.enemy_field.x1 + _pad;
				    var _max_x = global.enemy_field.x2 - _pad;
    
				    var _min_y = global.enemy_field.y1 + _pad;
				    var _max_y = global.enemy_field.y2 - _pad;
    
				    target_loc[i].x = irandom_range(_min_x, _max_x);
				    target_loc[i].y = irandom_range(_min_y, _max_y);
				}
				
			}
			},
	
		small_square_spell : {
			type	: "square",
			damage	: 50,
			length	: 20,
			width	: 50,
			run_spell : function(wild){
				var spell_unit = instance_create_layer(wild[0],wild[1], global.rm_layer, obj_square_spell)
				spell_unit._width=wild[2]*2
				spell_unit._height=wild[3]*2
				spell_unit.damage=self.damage
				spell_unit.alarm[0]=100
			}
			},
	
		large_square_spell : {
			type	: "square",
			damage	: 50,
			length	: 200,
			width	: 500,
			run_spell : function(wild){
				var spell_unit = instance_create_layer(wild[0],wild[1], global.rm_layer, obj_square_spell)
				spell_unit._width=wild[2]*2
				spell_unit._height=wild[3]*2
				spell_unit.damage=self.damage
				spell_unit.alarm[0]=100
			}
			},
		}
}

