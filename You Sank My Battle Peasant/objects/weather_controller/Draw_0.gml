if (fog_alpha > 0)
{
    var _width = surface_get_width(application_surface);
    var _height = surface_get_height(application_surface);

    shader_set(fog_shader);

    shader_set_uniform_f(fog_u_time, fog_time);
    shader_set_uniform_f(fog_u_alpha, fog_alpha);
    shader_set_uniform_f(fog_u_resolution, _width, _height);

    draw_set_color(c_white);
    draw_set_alpha(1);

    draw_rectangle(
        fog_left,
        fog_top,
        fog_right,
        fog_bottom,
        false
    );

    shader_reset();

    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (blind_alpha > 0)
{
    draw_set_color(c_white);
    draw_set_alpha(blind_alpha);
    draw_rectangle(0, 0, room_width, room_height, false);

    draw_set_alpha(1);
    draw_set_color(c_white);
}

if (rain_alpha > 0)
{
    var _width = surface_get_width(application_surface);
    var _height = surface_get_height(application_surface);

    shader_set(sh_rain);

    shader_set_uniform_f(rain_u_time, rain_time);
    shader_set_uniform_f(rain_u_alpha, rain_alpha);
    shader_set_uniform_f(rain_u_resolution, _width, _height);

    draw_set_color(c_white);
    draw_set_alpha(1);

    draw_rectangle(0, 0, room_width, room_height, false);

    shader_reset();

    draw_set_alpha(1);
    draw_set_color(c_white);
}

