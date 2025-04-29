shader_type canvas_item;

//voor rond draaien
uniform float cirkelGrootte = 50;
uniform float rotatieSnelheid = 1;

//voor fragment


void vertex() {
	VERTEX.y += cos(TIME*rotatieSnelheid) * cirkelGrootte;
	VERTEX.x += sin(TIME*rotatieSnelheid) * cirkelGrootte;
}

//inverteer de kleur wanneer de sprite in de onderkant van cirkel is
void fragment() {
	vec4 input_color = texture(TEXTURE,UV);
	//wanneer rechtsonder aan het draaien inverteer de rode kleur
	if (cos(TIME*rotatieSnelheid) * cirkelGrootte > 0.0 && sin(TIME*rotatieSnelheid) * cirkelGrootte > 0.0 ){
		vec3 inverted_color = vec3(1.0) - input_color.r;
		COLOR = vec4(inverted_color, input_color.a);
	}
	//wanneer rechtsboven aan het draaien inverteer de groene kleur
	if (cos(TIME*rotatieSnelheid) * cirkelGrootte < 0.0 && sin(TIME*rotatieSnelheid) * cirkelGrootte > 0.0 ){
		vec3 inverted_color = vec3(1.0) - input_color.g;
		COLOR = vec4(inverted_color, input_color.a);
	}
	//wanneer linksonder aan het draaien inverteer de blawe kleur
	if (cos(TIME*rotatieSnelheid) * cirkelGrootte > 0.0 && sin(TIME*rotatieSnelheid) * cirkelGrootte < 0.0 ){
		vec3 inverted_color = vec3(1.0) - input_color.b;
		COLOR = vec4(inverted_color, input_color.a);
	}
	//wanneer linksbovern aan het draaien inverteer alle kleuren
	if (cos(TIME*rotatieSnelheid) * cirkelGrootte < 0.0 && sin(TIME*rotatieSnelheid) * cirkelGrootte < 0.0 ){
		vec3 inverted_color = vec3(1.0) - input_color.rgb;
		COLOR = vec4(inverted_color, input_color.a);
	}
	//else{
		//vec2 uv = UV;
		//uv.y = 1.0 - uv.y;
		//vec4 tex_color = texture(TEXTURE, uv);
		//COLOR = tex_color;
	//}
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
