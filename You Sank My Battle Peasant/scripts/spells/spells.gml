

set_spells()
global.base_deck = [
global.spell.line_spell,
global.spell.small_square_spell,
global.spell.small_AOE_spell,
global.spell.large_AOE_spell,
//global.spell.summon_spell,
global.spell.large_square_spell
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
			run_spell : function(wild){
				
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
				spell_unit.alarm[0]=100
			}
			},
	
		summon_spell : {
			type	: "freecast",
			damage	: 50,
			range	: 0,
			run_spell : function(wild){
				
			}
			},
	
		small_square_spell : {
			type	: "square",
			damage	: 50,
			length	: 20,
			width	: 50,
			run_spell : function(wild){
				
			}
			},
	
		large_square_spell : {
			type	: "square",
			damage	: 50,
			length	: 200,
			width	: 500,
			run_spell : function(wild){
				
			}
			},
		}
}

