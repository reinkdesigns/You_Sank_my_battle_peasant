#macro diag_mod 0.707
#macro global_x 960
global.world = 3
global.blind = false
global.rain = false
global._ping_alpha = 0
global.w_str = "10"
global.debug = false
global.w_dir = "Northern"
global.wild_magic = noone
global.unit_list =[]

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

random_set_seed(randomise())
window_enable_borderless_fullscreen(true)
window_set_fullscreen(true)


global.spell_field = {
	x1 : 185,
	y1 : 265,
	x2 : 775,
	y2 : 890

}

global.enemy_field = {
	x1 : 1145,
	y1 : 265,
	x2 : 1735,
	y2 : 890
}
global.march_posistion = []
for(i=1;i<12;i++){
	array_push(global.march_posistion,{x:i*160,y:180})
}

global.march_posistion_float = []
for(i=1;i<12;i++){
	array_push(global.march_posistion_float,{x:i*160,y:125})
}

global.directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"];
global.wind_direction = 0

global.chest_size = ["spr_Small_","spr_Medium_","spr_Large_"]
global.chest_type = ["WoodenChest_","IronChest_","GoldenChest_"]
global.chest_state = ["Idle","Open"]


global.unit_type		=[
	"Archer",
	"Armored_Axeman",
	"Armored_Orc",
	"Armored_Skeleton",
	"Bat",
	"Black_Knight_A",
	"Black_Knight_B",
	"Black_Knight_C",
	"Blood_Monster",
	"Demon_A",
	"Demon_B",
	"Demon_C",
	"Demon_D",
	"Demon_E",
	"Demoness_A",
	"Demoness_B",
	"Elite_Orc",
	"Eyeball_Monster",
	"Flame_Golem",
	"Ghostfire",
	"Greatsword_Skeleton",
	"Hellbat",
	"Hellhound",
	"Knight",
	"Knight_Templar",
	"Lancer",
	"Lava_Slime",
	"Minotaur",	
	"Necromancer",
	"Orc",
	"Orc_Rider",
	"Priest",
	"Skeleton",
	"Skeleton_Archer",
	"Slime",
	"Soldier",
	"Swordsman",
	"Warlock",
	"Werebear",
	"Werewolf",
	"Wizard",
	]



global.unit_animation	=["Idle","Walk","Hurt","Death","Attack01","Attack02"]



function UnitData(_unit, _overrides = {}) constructor
{
    hp				= variable_struct_exists(_overrides, "hp") ? _overrides.hp : 100;
    mp				= variable_struct_exists(_overrides, "mp") ? _overrides.mp : 100;
	attack_1_damage	= variable_struct_exists(_overrides, "attack_1_damage") ? _overrides.attack_1_damage : 10;		
	attack_2_damage	= variable_struct_exists(_overrides, "attack_2_damage") ? _overrides.attack_2_damage : 20;		
	field_movement	= variable_struct_exists(_overrides, "field_movement") ? _overrides.field_movement : 100;		
	march_movement	= variable_struct_exists(_overrides, "march_movement") ? _overrides.march_movement : 1;	
    can_cast		= variable_struct_exists(_overrides, "can_cast") ? _overrides.can_cast : false;
    can_block		= variable_struct_exists(_overrides, "can_block") ? _overrides.can_block : false;
    is_summon		= variable_struct_exists(_overrides, "is_summon") ? _overrides.is_summon : false;
    is_ranged		= variable_struct_exists(_overrides, "is_ranged") ? _overrides.is_ranged : false;
    range			= variable_struct_exists(_overrides, "range") ? _overrides.range : false;
    unit			= _unit + "_";
    special			= variable_struct_exists(_overrides, "special") ? _overrides.special : false;
    special2		= variable_struct_exists(_overrides, "special2") ? _overrides.special2 : false;
    float			= variable_struct_exists(_overrides, "float") ? _overrides.float : false;
    description		= variable_struct_exists(_overrides, "description") ? _overrides.description : "Add Text";
}




global.unit = {
	
    Archer : new UnitData("Archer", {
		hp			: 100,
		mp			: 100,
        is_ranged	: "Both",
		range		: 11,
        special		: Arrow01,
        special2	: Arrow02
		}),
	
	Armored_Axeman : new UnitData("Armored_Axeman", {
		hp			: 100,
		mp			: 100,
    }),
	
	Armored_Orc : new UnitData("Armored_Orc", {
		hp			: 100,
		mp			: 100,
		can_block	: true,
    }),

	Armored_Skeleton : new UnitData("Armored_Skeleton", {
		hp			: 100,
		mp			: 100,
		is_summon	: true,
    }),
	
	Bat : new UnitData("Bat", {
		hp			: 100,
		mp			: 100,
		float		: true,
    }),
	
	Black_Knight_A : new UnitData("Black_Knight_A", {
		hp			: 100,
		mp			: 100,
		
    }),
	
	Black_Knight_B : new UnitData("Black_Knight_B", {
		hp			: 100,
		mp			: 100,
		can_block	: true,
		is_ranged	: "Attack02",
		range		: 11,
		special		: Cannonball,
    }),
	
	Black_Knight_C : new UnitData("Black_Knight_C", {
		hp			: 100,
		mp			: 100,
		can_cast	: "Attack02",
		range		: 11,
		special		: Black_Knight_Beam,
    }),
		
	Blood_Monster : new UnitData("Blood_Monster", {
		hp			: 100,
		mp			: 100,
    }),
	
	Demon_A : new UnitData("Demon_A", {
		hp			: 100,
		mp			: 100,
    }),
	
	Demon_B : new UnitData("Demon_B", {
		hp			: 100,
		mp			: 100,
		is_ranged	: "Attack01",
		range		: 11,
		special		: Arrow04
    }),
	
	Demon_C : new UnitData("Demon_C", {
		hp			: 100,
		mp			: 100,
		float		: true,
    }),
	
	Demon_D : new UnitData("Demon_D", {
		hp			: 100,
		mp			: 100,
    }),
	
	Demon_E : new UnitData("Demon_E", {
		hp			: 100,
		mp			: 100,
    }),

	Demoness_A : new UnitData("Demoness_A", {
		hp			: 100,
		mp			: 100,
    }),


	Demoness_B : new UnitData("Demoness_B", {
		hp			: 100,
		mp			: 100,
		float		: true,
    }),
	
	Elite_Orc : new UnitData("Elite_Orc", {
		hp			: 100,
		mp			: 100,
    }),

    Eyeball_Monster : new UnitData("Eyeball_Monster", {
		hp			: 100,
		mp			: 100,
        is_ranged	: "Attack02",
		range		: 2,
		}),
		
	Flame_Golem : new UnitData("Flame_Golem", {
		hp			: 100,
		mp			: 100,
    }),		
		
	Ghostfire : new UnitData("Ghostfire", {
		hp			: 100,
		mp			: 100,
		float		: true,
		is_ranged	: "Attack02",
		range		: 2,
    }),		
		
	Greatsword_Skeleton : new UnitData("Greatsword_Skeleton", {
		hp			: 100,
		mp			: 100,
		is_summon	: true
    }),				
		
	Hellbat : new UnitData("Hellbat", {
		hp			: 100,
		mp			: 100,
		float		: true,
    }),
	
	Hellhound : new UnitData("Hellhound", {
		hp			: 100,
		mp			: 100,
    }),
	
	Knight : new UnitData("Knight", {
		hp			: 100,
		mp			: 100,
		can_block	: true,
    }),
		
	Knight_Templar : new UnitData("Knight_Templar", {
		hp			: 100,
		mp			: 100,
		can_block	: true,
    }),	
	
	Lancer : new UnitData("Lancer", {
		hp			: 100,
		mp			: 100,
    }),	
	
	Lava_Slime : new UnitData("Lava_Slime", {
		hp			: 100,
		mp			: 100,
    }),		
	
	Minotaur : new UnitData("Minotaur", {
		hp			: 100,
		mp			: 100,
    }),	
	
	Necromancer : new UnitData("Necromancer", {
		hp			: 100,
		mp			: 100,
		can_cast	: "Attack02",
		special		: Necromancer_Attack_Effect,
    }),	
	
	Orc : new UnitData("Orc", {
		hp			: 100,
		mp			: 100,
    }),		
	
	Orc_Rider : new UnitData("Orc_Rider", {
		hp			: 100,
		mp			: 100,
		can_block	: true,
    }),		

	Priest : new UnitData("Priest", {
		hp			: 100,
		mp			: 100,
		can_cast	: "Both",
		range		: 11,
		special		: Priest_Attack_effect,
		special2	: Priest_Heal_effect,
    }),		
	
	Skeleton : new UnitData("Skeleton", {
		hp			: 100,
		mp			: 100,
		can_block	: true,
		is_summon	: true,
    }),	
	
	Skeleton_Archer : new UnitData("Skeleton_Archer", {
		hp			: 100,
		mp			: 100,
		is_ranged	: "Both",
		range		: 11,
		special		: Arrow03,
		special2 	: Arrow01,
		is_summon	: true,
    }),	
	
	Slime : new UnitData("Slime", {
		hp			: 100,
		mp			: 100,
    }),	
	
	Soldier : new UnitData("Soldier", {
		hp			: 100,
		mp			: 100,
    }),		
	
	Swordsman : new UnitData("Swordsman", {
		hp			: 100,
		mp			: 100,
    }),	
	
	Warlock : new UnitData("Warlock", {
		hp			: 100,
		mp			: 100,
		can_cast	: "Both",
		range		: 11,
		special		: Warlock_Effect,
		special2	: Black_Knight_Beam,
    }),	
	
	Werebear : new UnitData("Werebear", {
		hp			: 100,
		mp			: 100,
    }),	
	
	Werewolf : new UnitData("Werewolf", {
		hp			: 100,
		mp			: 100,
    }),	
	
	Wizard : new UnitData("Wizard", {
		hp			: 100,
		mp			: 100,
		can_cast	: "Both",
		range		: 11,
		special		: Wizard_Firebolt_Effect,
		special2	: Wizard_Ice_Effect,
    }),	
	
}

