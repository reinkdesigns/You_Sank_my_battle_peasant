global.line_break = "_______________________";
global.unit_term = "minion";
set_global_tooltip()
function set_global_tooltip(){
	global.tooltip = {
	    // Wild Magics

	    null_magic: [
	        "No Wild Magic!",
	        $"{global.line_break}",
	        "No magic is manipulating the",
	        "placement of your next spell."
	    ],

	    blind: [
	        "Wild Magic: Blind!",
	        $"{global.line_break}",
	        "A fog covers the field,",
	        $"hiding all enemy {global.unit_term}s."
	    ],

	    horz_mirror: [
	        "Wild Magic: Horizontal Mirror!",
	        $"{global.line_break}",
	        "A shimmer across the field",
	        "makes your spell's final location",
	        "land in a horizontally mirrored location."
	    ],

	    vert_mirror: [
	        "Wild Magic: Vertical Mirror!",
	        $"{global.line_break}",
	        "A shimmer across the field",
	        "makes your spell's final location",
	        "land in a vertically mirrored location."
	    ],

	    horz_squish: [
	        "Wild Magic: Horizontal Squish!",
	        $"{global.line_break}",
	        "You feel a compression in your mana.",
	        "Your next spell's final location",
	        "will be horizontally squished."
	    ],

	    vert_squish: [
	        "Wild Magic: Vertical Squish!",
	        $"{global.line_break}",
	        "You feel a compression in your mana.",
	        "Your next spell's final location",
	        "will be vertically squished."
	    ],

	    shrink: [
	        "Wild Magic: Shrink!",
	        $"{global.line_break}",
	        "You feel a compression in your mana.",
	        "Your next spell's final location",
	        "will be squished in all directions."
	    ],

	    horz_stretch: [
	        "Wild Magic: Horizontal Stretch!",
	        $"{global.line_break}",
	        "You feel an expansion in your mana.",
	        "Your next spell's final location",
	        "will be horizontally stretched."
	    ],

	    vert_stretch: [
	        "Wild Magic: Vertical Stretch!",
	        $"{global.line_break}",
	        "You feel an expansion in your mana.",
	        "Your next spell's final location",
	        "will be vertically stretched."
	    ],

	    enlarge: [
	        "Wild Magic: Enlarge!",
	        $"{global.line_break}",
	        "You feel an expansion in your mana.",
	        "Your next spell's final location",
	        "will be stretched in all directions."
	    ],

	    rotate_90_R: [
	        "Wild Magic: Rotation!",
	        $"{global.line_break}",
	        "You feel the world begin to spin.",
	        "Your next spell's final location",
	        "will be rotated 90 degrees clockwise."
	    ],

	    rotate_180: [
	        "Wild Magic: Rotation!",
	        $"{global.line_break}",
	        "You feel the world begin to spin.",
	        "Your next spell's final location",
	        "will be rotated 180 degrees."
	    ],

	    rotate_90_L: [
	        "Wild Magic: Rotation!",
	        $"{global.line_break}",
	        "You feel the world begin to spin.",
	        "Your next spell's final location",
	        "will be rotated 90 degrees counterclockwise."
	    ],

	    wind: [
	        "Wild Magic: Wind!",
	        $"{global.line_break}",
	        "A strong wind shifts",
	        "your spell's final location",
	        $"by {global.w_str} units",
	        $"in the {global.w_dir} direction."
	    ]
	};
}