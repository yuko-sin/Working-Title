extends Area2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		melee()

func melee() -> void:
	rotation_degrees = get_parent().get_node("Weapon").rotation_degrees
	
	for body in get_overlapping_bodies():
		if body.is_in_group("enemy"):
			Combat.hit(Global.player, body)
			Audio.instance_sound2D("hit_flesh", body.position)
