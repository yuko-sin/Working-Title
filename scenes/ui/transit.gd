extends Control

var scene : String

func _ready() -> void:
	get_tree().paused = true
	$AnimationPlayer.play("fade_in")
	Global.save_game()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match(anim_name):
		"fade_in":
			Global.area.queue_free()
			Global.add_child(load(scene).instantiate())
			Global.UI.add_child(load("res://scenes/ui/ui.tscn").instantiate())
			get_tree().paused = false
			$AnimationPlayer.play("fade_out")
		"fade_out":
			queue_free()
