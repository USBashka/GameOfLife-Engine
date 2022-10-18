shader_type canvas_item;

uniform vec4 color = vec4(1, 1, 1, 1);
uniform vec4 background = vec4(0, 0, 0, 0);

void fragment() {
	COLOR = COLOR.r * color;
	COLOR += (1.0 - COLOR.r) * background;
}
