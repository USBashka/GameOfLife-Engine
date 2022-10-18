extends Camera2D


var dragging := false
var target_zoom := 1.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	zoom = lerp(zoom, Vector2(target_zoom, target_zoom), 0.5)

func _input(event):
	if event is InputEventMouseMotion:
		if dragging:
			position -= event.relative / zoom
	elif event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			target_zoom *= 0.707109
			#position = lerp(position, event.position, 0.2)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			target_zoom *= 1.41421
			#position = lerp(position, event.position, 0.2)
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				dragging = true
			else:
				dragging = false
