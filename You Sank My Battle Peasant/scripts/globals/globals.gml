

random_set_seed(randomise())
window_enable_borderless_fullscreen(true)
window_set_fullscreen(true)

global.directions = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"];
global.wind_direction = 0

global.chest_size = ["spr_Small_","spr_Medium_","spr_Large_"]
global.chest_type = ["WoodenChest_","IronChest_","GoldenChest_"]
global.chest_state = ["Idle","Open"]

global.unit_type		=[
	"Archer_",
	"Armored_Axeman_",
	"Armored_Orc_",
	"Armored_Skeleton_",
	"Bat_",
	"Black_Knight_A_",
	"Black_Knight_B_",
	"Black_Knight_C_",
	"Blood_monster_",
	"Demon_A_",
	"Demon_B_",
	"Demon_C_",
	"Demon_D_",
	"Demon_E_",
	"Demoness_A_",
	"Demoness_B_",
	"Elite_Orc_",
	"Eyeball_Monster_",
	"Flame_Golem_",
	"Ghostfire_",
	"Greatsword_Skeleton_",
	"Hellbat_",
	"Hellhound_",
	"Knight_",
	"Knight_Templar_",
	"Lancer_",
	"Lava_Slime_",
	"Minotaur_",
	"Necromancer_",
	"Orc_",
	"Orc_Rider_",
	"Priest_",
	"Skeleton_",
	"Skeleton_Archer_",
	"Slime_",
	"Soldier_",
	"Swordsman_",
	"Warlock_",
	"Werebear_",
	"Werewolf_",
	"Wizard_",
	]



global.unit_animation	=["Idle","Walk","Hurt","Death","Attack01","Attack02"]



function UnitData(_unit, _overrides = {}) constructor
{
    return {
        hp          : variable_struct_exists(_overrides, "hp") ? _overrides.hp : 100,
        mp          : variable_struct_exists(_overrides, "mp") ? _overrides.mp : 100,
        can_cast    : variable_struct_exists(_overrides, "can_cast") ? _overrides.can_cast : false,
        can_block   : variable_struct_exists(_overrides, "can_block") ? _overrides.can_block : false,
        is_summon   : variable_struct_exists(_overrides, "is_summon") ? _overrides.is_summon : false,
        is_ranged      : variable_struct_exists(_overrides, "ranged") ? _overrides.ranged : false,
        range      : variable_struct_exists(_overrides, "ranged") ? _overrides.ranged : false,
        unit        : _unit+"_",
        special     : variable_struct_exists(_overrides, "special") ? _overrides.special : false,
        special2     : variable_struct_exists(_overrides, "special") ? _overrides.special : false,
        float       : variable_struct_exists(_overrides, "float") ? _overrides.float : false,
        description : variable_struct_exists(_overrides, "description") ? _overrides.description : "Add Text"
    };
}



global.unit = {
	
    Archer : new UnitData("Archer", {
		hp			: 100,
		mp			: 100,
        is_ranged	: "Both",
		range		: "Long",
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
	
	Black_Knight_A : new UnitData("Black_Knight_A", {
		hp			: 100,
		mp			: 100,
		
    }),
	
	Black_Knight_B : new UnitData("Black_Knight_B", {
		hp			: 100,
		mp			: 100,
		can_block	: true,
		is_ranged	: "Attack02",
		range		: "Long",
		special		: Cannonball,
    }),
	
	Black_Knight_C : new UnitData("Black_Knight_C", {
		hp			: 100,
		mp			: 100,
		can_cast	: "Attack02",
		range		: "Long",
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
		range		: "Long",
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
		range		: "Short",
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
		range		: "Short",
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
    })
		
		
		

}
