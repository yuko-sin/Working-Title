extends State
class_name DeathStateEnemy

func _ready() -> void:
	animation.play("death")
	remove_from_group("enemy")
	host.get_node("CollisionShape2D").set_deferred("disabled", true)
	host.add_child(load("res://scenes/particles/loot.tscn").instantiate())
	Audio.instance_sound2D("zombie_die", host.position)
