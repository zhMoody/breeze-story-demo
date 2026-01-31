shader_type canvas_item;

uniform float shake_intensity = 0.0;
uniform float shake_speed = 20.0;

void vertex(){
	vec2 shake = vec2(0.0);

	float weight = clamp(-VERTEX.y / 25.0, 0.0, 1.0);
	
	shake.x = sin(TIME * shake_speed) * shake_intensity * weight;
	VERTEX.xy += shake;
}