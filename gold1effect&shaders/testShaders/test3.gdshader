shader_type canvas_item;

// gradient shader
void fragment() {
	// Called for every pixel the material is visible on.
	vec4 color = texture(TEXTURE, UV);
	vec3 gradient_color = mix(vec3(0.0,1.0,0.0), vec3(0.0,0.0,1.0), UV.y);
	color.rgb = mix(color.rgb, gradient_color, 0.5);
	COLOR = color;
}
