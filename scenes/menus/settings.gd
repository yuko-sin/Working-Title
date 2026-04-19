extends Panel

func _on_mute_audio_pressed() -> void:
	AudioServer.set_bus_mute(0, true)

func _on_ok_pressed() -> void:
	queue_free()
