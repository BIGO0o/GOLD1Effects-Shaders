shader_type canvas_item;


void fragment() {
	vec4 input_color = texture(TEXTURE, UV); //pak kleur van de pixel
	
	float angle = sin(TIME *3.0) *1.57; //snelheid van draaien
	vec2 midden = UV - vec2(0.5); //pak het midden van de sprite
	
	//bereken nieuwe uv na rotatie
	float cos_a = cos(angle);
	float sin_a = sin(angle);
	
	vec2 rotated_uv = vec2(midden.x * cos_a - midden.y * sin_a, midden.x * sin_a + midden.y * cos_a);
	
	rotated_uv += vec2(0.5);
	
	//Pas enkel de bewerking toe aan de linker kant van de sprite
	if(rotated_uv.x < 0.5){
		input_color.rgb = mix(input_color.rgb, vec3(1.0, 0.4, 1.0), 0.7); //gebruik mix functie
	}
	else{
		input_color.rgb = mix(input_color.rgb, vec3(1.0, 1.0, 0.0), 0.7);
	}
	
	COLOR = input_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
