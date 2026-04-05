extends State
class_name StandStatePlayer

func _ready() -> void:
	animation.play("stand")

func _unhandled_key_input(event: InputEvent) -> void:
	if event.keycode in [KEY_W, KEY_A, KEY_S, KEY_D]:
		host.change_state("walk")
