fog_alpha = 0;
fog_time = 0;

fog_fade_speed = 0.6;

// Set these to your actual battlefield bounds.
fog_left = 0;
fog_top = 0;
fog_right = room_width;
fog_bottom = room_height;

fog_shader = sh_fog;

fog_u_time = shader_get_uniform(fog_shader, "u_time");
fog_u_alpha = shader_get_uniform(fog_shader, "u_alpha");
fog_u_resolution = shader_get_uniform(fog_shader, "u_resolution");

blind_alpha = 0;
blind_fade_speed = 0.5;


gpu_fog_start = 17000


rain_time = 0;
rain_alpha = 0;

rain_fade_speed = 1.2;

rain_u_time = shader_get_uniform(sh_rain, "u_time");
rain_u_alpha = shader_get_uniform(sh_rain, "u_alpha");
rain_u_resolution = shader_get_uniform(sh_rain, "u_resolution");

