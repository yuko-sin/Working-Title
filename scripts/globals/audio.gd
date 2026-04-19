extends Node

var music_ambience : AudioStreamPlayer
var existing_sounds : Array

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta: float) -> void:
	if is_instance_valid(music_ambience) and not is_instance_valid(Global.area):
		music_ambience.queue_free()

func instance_music(music : String):
	if has_node("music"):
		get_node("music").queue_free()
	
	await get_tree().process_frame
	
	music_ambience = AudioStreamPlayer.new()
	music_ambience.set_bus("Music")
	music_ambience.stream = load("res://assets/audio/music/ambiences/" + music + ".wav")
	add_child(music_ambience)
	music_ambience.play()
	music_ambience.connect("finished", on_audioSteramPlayer_finished.bind(music_ambience))
	music_ambience.name = "music"

func instance_sound(sound : String):
	var audioStreamPlayer = AudioStreamPlayer.new()
	audioStreamPlayer.set_bus("Sounds")
	audioStreamPlayer.stream = load("res://assets/audio/sounds/" + sound + ".wav")
	add_child(audioStreamPlayer)
	audioStreamPlayer.play()
	audioStreamPlayer.connect("finished", on_audioSteramPlayer_finished.bind(audioStreamPlayer))

func instance_sound2D(sound : String, position : Vector2):
	var audioStreamPlayer2D = AudioStreamPlayer2D.new()
	audioStreamPlayer2D.set_bus("Sounds")
	audioStreamPlayer2D.stream = load("res://assets/audio/sounds/" + sound + ".wav")
	audioStreamPlayer2D.position = position
	Global.area.add_child(audioStreamPlayer2D)
	audioStreamPlayer2D.position = position
	audioStreamPlayer2D.play()
	audioStreamPlayer2D.connect("finished", on_audioSteramPlayer2D_finished.bind(audioStreamPlayer2D))

func on_audioSteramPlayer_finished(audioStreamPlayer : AudioStreamPlayer):
	audioStreamPlayer.call_deferred("free")

func on_audioSteramPlayer2D_finished(audioStreamPlayer2D : AudioStreamPlayer2D):
	audioStreamPlayer2D.call_deferred("free")
