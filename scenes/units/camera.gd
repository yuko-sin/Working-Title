extends Camera2D

var zoom_speed := 0.1
var min_zoom := 0.5
var max_zoom := 2.0
var zoom_target := Vector2.ONE

func _process(delta: float) -> void:
	zoom = zoom.lerp(zoom_target, zoom_speed)
	zoom = zoom.clamp(Vector2(min_zoom, min_zoom), Vector2(max_zoom, max_zoom))

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP: 
				zoom_target += Vector2(0.1, 0.1)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom_target -= Vector2(0.1, 0.1)
