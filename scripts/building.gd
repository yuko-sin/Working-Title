extends StaticBody2D
class_name Building

@export var to_area : String
@export var spawn_position : Vector2i

func _ready() -> void:
	set_process_unhandled_key_input(false)
	get_node("Area2D").connect("body_entered", on_Area2d_body_entered)
	get_node("Area2D").connect("body_exited", on_Area2d_body_exited)

func _unhandled_key_input(event: InputEvent) -> void:
	if event.keycode == KEY_E and not event.is_pressed():
		get_node("Area2D").disconnect("body_exited", on_Area2d_body_exited)
		Global.ui.transit(to_area)

func on_Area2d_body_entered(body) -> void:
	if body == Global.player:
		set_process_unhandled_key_input(true)
		Global.ui.instantiate_trigger_hint(self, "E")

func on_Area2d_body_exited(body) -> void:
	if body == Global.player:
		set_process_unhandled_key_input(false)
		Global.ui.remove_trigger_hint()
