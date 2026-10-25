precision mediump float;

varying vec4 v_vColour;

uniform float u_time;
uniform float u_alpha;
uniform vec2 u_resolution;

float hash(vec2 p)
{
    p = mod(p, 289.0);
    p = mod((p * 34.0 + 1.0) * p, 289.0);
    return fract(p.x * p.y / 41.0);
}

float noise(vec2 p)
{
    vec2 i = floor(p);
    vec2 f = fract(p);

    f = f * f * (3.0 - 2.0 * f);

    float a = hash(i);
    float b = hash(i + vec2(1.0, 0.0));
    float c = hash(i + vec2(0.0, 1.0));
    float d = hash(i + vec2(1.0, 1.0));

    return mix(
        mix(a, b, f.x),
        mix(c, d, f.x),
        f.y
    );
}
void main()
{
    vec2 uv = gl_FragCoord.xy / u_resolution;
    vec2 aspect = vec2(u_resolution.x / u_resolution.y, 1.0);
    vec2 p = uv * aspect * 4.0;

    // A slow wave that travels through the fog.
    float wave = sin(p.y * 2.0 - u_time * 0.8);
    float wave2 = sin(p.y * 3.2 - u_time * 0.55 + 1.5);

    // All layers roll left, with slightly different speeds.
    vec2 drift1 = vec2(-u_time * 0.035, u_time * 0.006);
    vec2 drift2 = vec2(-u_time * 0.050, -u_time * 0.009);
    vec2 drift3 = vec2(-u_time * 0.070, u_time * 0.014);

    // Distort each layer to create rolling, wave-like movement.
    vec2 p1 = p + drift1 + vec2(wave * 0.10, wave2 * 0.04);
    vec2 p2 = p * 1.8 + drift2 + vec2(wave2 * 0.12, wave * 0.06);
    vec2 p3 = p * 3.0 + drift3 + vec2(wave * 0.08, wave2 * 0.08);

    float n1 = noise(p1);
    float n2 = noise(p2);
    float n3 = noise(p3);

    float fog1 = smoothstep(0.20, 0.55, n1);
    float fog2 = smoothstep(0.25, 0.60, n2);
    float fog3 = smoothstep(0.30, 0.65, n3);

    float fog = clamp(
        fog1 * 0.50 +
        fog2 * 0.35 +
        fog3 * 0.25,
        0.0,
        1.0
    );

    // Slowly shift the fog between white and different grays.
    float color_wave = 0.5 + 0.5 * sin(u_time * 0.25 + wave * 0.8);

    vec3 white = vec3(1.0, 1.0, 1.0);
    vec3 light_gray = vec3(0.78, 0.78, 0.78);
    vec3 dark_gray = vec3(0.48, 0.48, 0.48);

    vec3 fog_color = mix(light_gray, white, color_wave);
    fog_color = mix(
        fog_color,
        dark_gray,
        fog3 * 0.35 + (1.0 - color_wave) * 0.20
    );

    gl_FragColor = vec4(fog_color, fog * u_alpha);
}