enum wild_magic
{
    no_effect,
    horz_mirror,
    vert_mirror,
    rotate_90,
    rotate_180,
    rotate_270,
	horz_squish,
	vert_squish,
	horz_stretch,
	vert_stretch,
	shrink,
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
global.max_wildmagic = wild_magic.COUNT