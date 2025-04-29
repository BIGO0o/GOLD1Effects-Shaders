shader_type canvas_item;

//solid color shader
void fragment() {
	vec4 color = texture(TEXTURE,UV);
		color.r = 0.8;
		color.g = 1.0;
		color.b = 0.6;
		COLOR = color;// Called for every pixel the material is visible on.
}
