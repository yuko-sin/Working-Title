extends Sprite2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		swing()

func swing() -> void:
	region_rect.position.x = [0.0, 64.0, 128.0, 196.0].pick_random()
	$AnimationPlayer.play("default")
	Audio.instance_sound2D("swing_sword", Global.player.position)
