shader_type canvas_item;


//TINT SHADER
void fragment() {
	vec4 color = texture(TEXTURE, UV);
	color.rgb = mix(color.rgb, vec3(0.0,1.0,0.0), 0.5);
	COLOR = color;
}
