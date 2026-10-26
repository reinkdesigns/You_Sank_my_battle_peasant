var _grid = 10;

var _cell_w = (global.spell_field.x2 - global.spell_field.x1) / _grid;
var _cell_h = (global.spell_field.y2 - global.spell_field.y1) / _grid;

// Vertical lines
for (var i = 0; i <= _grid; i++) {
    var _x = global.spell_field.x1 + i * _cell_w;
    draw_line(_x, global.spell_field.y1, _x, global.spell_field.y2);
}

// Horizontal lines
for (var i = 0; i <= _grid; i++) {
    var _y = global.spell_field.y1 + i * _cell_h;
    draw_line(global.spell_field.x1, _y, global.spell_field.x2, _y);
}