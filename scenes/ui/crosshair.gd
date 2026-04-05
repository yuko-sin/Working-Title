extends Node2D

var is_out : bool

func _ready() -> void:
	scale /= 4.0
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta: float) -> void:
	position = get_global_mouse_position()
	
	if Global.player.velocity == Vector2.ZERO:
		if is_out:
			$AnimationPlayer.play_backwards("out")
			is_out = false
	else:
		if not is_out:
			is_out = true
			$AnimationPlayer.play("out")

func _on_tree_exited() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
