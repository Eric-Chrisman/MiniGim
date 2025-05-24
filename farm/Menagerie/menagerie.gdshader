shader_type canvas_item;

uniform float min_scale = 1.5;
uniform float max_scale = 0.5;

void vertex() {
    // Get normalized screen position (0-1)
    vec2 screen_uv = (SCREEN_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
    screen_uv = (screen_uv + 1.0) / 2.0; // Convert from [-1,1] to [0,1]

    // Invert Y-axis (0 = bottom, 1 = top)
    float screen_y = 1.0 - screen_uv.y;

    // Calculate scale based on vertical position
    float scale = mix(min_scale, max_scale, screen_y);

    // Apply scaling
    VERTEX *= scale;
}

