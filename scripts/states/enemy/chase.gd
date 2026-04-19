extends State
class_name ChaseStateEnemy

var timer : Timer = Timer.new()

func _ready() -> void:
	animation.play("run")
	Audio.instance_sound2D("zombie_aggro", host.position)

func _physics_process(delta: float) -> void:
	host.movement_direction = (host.focus.position - host.position).normalized()
	host.velocity = host.movement_direction * host.movement_speed * 2.0
	host.move_and_slide()
	
	if host.position.distance_to(host.focus.position) <= 8.0:
		host.queue_free()
