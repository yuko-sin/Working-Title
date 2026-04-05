extends Control

func _on_play_pressed() -> void:
	queue_free()
	Global.UI.add_child(load("res://scenes/system/loadingScreen.tscn").instantiate())

func _on_settings_pressed() -> void:
	pass

func _on_exit_pressed() -> void:
	get_tree().quit()
