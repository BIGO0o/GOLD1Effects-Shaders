shader_type canvas_item;

//voor wavy effect setttings
uniform float strength = 2.0;
uniform float speed = 2.0;

//wavy effect logica
void vertex() {
    float offset = sin(VERTEX.y * 0.9 + TIME * speed) * strength;
    VERTEX.x += offset;
}

void fragment() {
	vec4 input_color = texture(TEXTURE, UV); //pak kleur van de huidige pixel
    vec3 inverted_color = vec3(1.0) - input_color.rgb; //trek 1 van elke kleur af enkel rood groen blauw geen alpha/ doorzichtigeheid
    COLOR = vec4(inverted_color, input_color.a); //geef de geinverteerde kleur aan de pixel, laat alpha/ doorzichtigheid intact
}

