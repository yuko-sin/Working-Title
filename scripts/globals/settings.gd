extends Node

var mute_audio : bool

func _ready() -> void:
	pass

var save_path : String = "user://settings.save"

func save_settings() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(mute_audio)
	file.close()

func load_settings() -> void:
	var file = FileAccess.open(save_path, FileAccess.READ)
	mute_audio  = file.get_var()
	file.close()
