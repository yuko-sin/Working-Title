extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if get_global_mouse_position().y < global_position.y:
		show_behind_parent = true
	else:
		show_behind_parent = false
	
	if not $AnimationPlayer.is_playing():
		rotation_degrees = get_parent().get_node("Weapon").rotation_degrees
	
	if Input.is_action_just_pressed("ui_accept"):
		$AnimationPlayer.play("default")
