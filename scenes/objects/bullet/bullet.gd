extends Area2D

var host : Unit
var direction : Vector2
var speed : float = 1200.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	
	for body in get_overlapping_bodies():
		if body.is_in_group("enemy"):
			Combat.hit(host, body)
			Audio.instance_sound2D("bullet_impact_body", body.position)
			queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
