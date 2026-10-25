var _dt = delta_time / 1000000;

fog_time += _dt;

var _target = global.blind ? 16000 : 17000;

if (global.blind)
{
    fog_alpha = min(fog_alpha + fog_fade_speed * _dt, 0.65);
	blind_alpha = min(blind_alpha + blind_fade_speed * _dt, 0.4);

}
else
{
    fog_alpha = max(fog_alpha - fog_fade_speed * _dt, 0);
	blind_alpha = max(blind_alpha - blind_fade_speed * _dt, 0);

	
}



//gpu_fog_start = lerp(
//    gpu_fog_start,
//    _target,
//    min(1, 3 * _dt)
//);

//gpu_set_fog(
//    true,
//    c_white,
//    gpu_fog_start,
//    17000
//);


rain_time -= _dt;

if (global.rain)
{
    rain_alpha = min(rain_alpha + rain_fade_speed * _dt, 0.75);
}
else
{
    rain_alpha = max(rain_alpha - rain_fade_speed * _dt, 0);
}

