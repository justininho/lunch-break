shader_type canvas_item;

uniform vec4 outline_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float outline_width : hint_range(0, 10) = 1.0;
uniform float outline_softness : hint_range(0, 2.0) = 0.5;

void fragment() {
    vec4 sprite_color = texture(TEXTURE, UV);
    vec2 tex_size = 1.0 / vec2(textureSize(TEXTURE, 0));
    
    // Initialize outline color with full transparency
    vec4 final_color = vec4(0.0);
    
    // If we're inside the sprite, just show the sprite
    if (sprite_color.a > 0.0) {
        final_color = sprite_color;
    } else {
        float max_distance = outline_width * tex_size.x;
        float min_distance = 999999.0;
        
        // Sample neighboring pixels in a circle
        for (float x = -outline_width; x < outline_width; x++) {
            for (float y = -outline_width; y < outline_width; y++) {
                vec2 offset = vec2(x, y) * tex_size;
                float distance = length(offset);
                
                // Only sample within our max distance
                if (distance < max_distance) {
                    float sample = texture(TEXTURE, UV + offset).a;
                    if (sample > 0.0) {
                        min_distance = min(min_distance, distance);
                    }
                }
            }
        }
        
        // Create smooth outline based on minimum distance found
        if (min_distance < max_distance) {
            float alpha = 1.0 - smoothstep(0.0, max_distance * outline_softness, min_distance);
            final_color = vec4(outline_color.rgb, outline_color.a * alpha);
        }
    }
    
    COLOR = final_color;
}