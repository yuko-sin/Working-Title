extends Control

var progress : Array
var scene = "res://scenes/world/world.tscn"
var scene_load_status = 0

func _ready():
	ResourceLoader.load_threaded_request(scene)

func _process(delta):
	scene_load_status = ResourceLoader.load_threaded_get_status(scene, progress)
	
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		Global.main.add_child(load(scene).instantiate())
		Global.UI.add_child(load("res://scenes/ui/ui.tscn").instantiate())
		call_deferred("free")
