precision mediump float;

uniform float u_time;
uniform float u_alpha;
uniform vec2 u_resolution;

float hash(vec2 p)
{
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

void main()
{
    vec2 uv = gl_FragCoord.xy / u_resolution;

    // Stretch the grid horizontally to create narrow rain streaks.
    vec2 p = uv * vec2(95.0, 18.0);

    // Slant the rain and move it downward over time.
    p.x += p.y * 0.35;
    p.y += u_time * 18.0;

    vec2 cell = floor(p);
    vec2 f = fract(p);

    float seed = hash(cell);

    // Randomly vary the length of individual drops.
    float drop_length = mix(0.25, 0.95, hash(cell + 7.3));

    // Narrow vertical streaks within each cell.
    float horizontal = 1.0 - smoothstep(
        0.015, 0.07,
        abs(f.x - 0.5)
    );

    float vertical = smoothstep(0.0, 0.08, f.y)
        * (1.0 - smoothstep(drop_length, drop_length + 0.08, f.y));

    // Randomly leave some cells empty.
    float drops = step(0.58, seed) * horizontal * vertical;

    // Subtle variation in brightness.
    float brightness = mix(0.45, 0.9, seed);

    vec3 rain_color = vec3(0.72, 0.82, 0.95) * brightness;

    gl_FragColor = vec4(rain_color, drops * u_alpha);
}