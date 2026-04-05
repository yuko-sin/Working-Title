extends State
class_name WalkStateEnemy

var timer : Timer = Timer.new()

func _ready() -> void:
	animation.play("walk")
	add_child(timer)
	timer.wait_time = 1 + randf_range(0.0, 1.0)
	timer.start()
	timer.connect("timeout", on_timer_timeout)
	host.movement_direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0))

func _physics_process(delta: float) -> void:
	host.velocity = host.movement_direction * host.movement_speed
	host.move_and_slide()
	
	if Global.player.position.distance_to(host.position) <= host.line_of_sight:
		host.focus = Global.player
		host.change_state("chase")
		host.call_for_help(Global.player)

func on_timer_timeout() -> void:
	host.change_state("stand")
