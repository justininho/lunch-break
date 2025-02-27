shader_type canvas_item;

uniform vec4 outline_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float outline_width : hint_range(0.0, 10.0) = 1.0;
uniform float outline_intensity : hint_range(0.0, 1.0) = 0.5;
uniform float glow_blend : hint_range(0.0, 1.0) = 0.5;

// Pulse parameters
uniform float pulse_speed : hint_range(0.0, 5.0) = 1.0;
uniform float pulse_intensity : hint_range(0.0, 1.0) = 0.2;

void fragment() {
    vec4 current_color = texture(TEXTURE, UV);
    
    // Sample points for outline detection
    vec2 size = vec2(outline_width) / vec2(textureSize(TEXTURE, 0));
    float alpha = current_color.a;
    
    // Check surrounding pixels
    alpha += texture(TEXTURE, UV + vec2(0.0, size.y)).a;
    alpha += texture(TEXTURE, UV + vec2(size.x, 0.0)).a;
    alpha += texture(TEXTURE, UV + vec2(0.0, -size.y)).a;
    alpha += texture(TEXTURE, UV + vec2(-size.x, 0.0)).a;
    
    // Calculate pulse
    float pulse = sin(TIME * pulse_speed) * 0.5 + 0.5;
    pulse = mix(1.0, pulse, pulse_intensity);
    
    // Create outline effect
    vec4 final_color = current_color;
    if (current_color.a < 0.5 && alpha > 0.0) {
        vec4 outline = outline_color;
        outline.a *= outline_intensity * smoothstep(0.0, 2.0, alpha) * pulse;
        final_color = mix(current_color, outline, glow_blend);
    }
    
    COLOR = final_color;
}