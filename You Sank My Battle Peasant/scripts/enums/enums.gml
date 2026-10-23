

enum wild_magic{
    no_effect,
	blind,
    horz_mirror,
    vert_mirror,
    rotate_90,
    rotate_180,
    rotate_270,
	horz_squish,
	vert_squish,
	shrink,
	horz_stretch,
	vert_stretch,
	enlarge,
	wind_N,
	wind_NE,
	wind_E,
	wind_SE,
	wind_S,
	wind_SW,
	wind_W,
	wind_NW,
	COUNT
}

enum magic_types {
none,
blind,
mirror,
rotate,
squish,
stretch,
wind,
COUNT
}

enum spellshape{
line,
radius,
square,
null,
}

global.max_wildmagic = wild_magic.COUNT
/*
	
	wind_NE,
	wind_E,
	wind_SE,
	wind_S,
	wind_SW,
	wind_W,
	wind_NW,
	
	wind
		8_direction
	
	rotate
		left 90
		right 90
		180
		
	mirror
		horz
		vert
	
	squish
		horz
		vert
		shrink
	
	stretch
		horz
		vert
		expand
	
*/