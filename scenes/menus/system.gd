extends Control

func _ready() -> void:
	get_tree().paused = true

func _process(delta: float) -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_resume_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	queue_free()

func _on_settings_pressed() -> void:
	Global.UI.add_child(load("res://scenes/menus/settings.tscn").instantiate())

func _on_main_menu_pressed() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Global.area.queue_free()
	Global.ui.queue_free()
	Global.UI.add_child(load("res://scenes/menus/mainMenu.tscn").instantiate())

func _on_exit_game_pressed() -> void:
	get_tree().quit()

func _on_tree_exiting() -> void:
	get_tree().paused = false
