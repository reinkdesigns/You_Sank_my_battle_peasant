varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    vec4 col = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    vec3 target = vec3(83.0, 69.0, 69.0) / 255.0;

    if (distance(col.rgb, target) < 0.01) {
        col.a = 0.4;
    }

    gl_FragColor = col;
}