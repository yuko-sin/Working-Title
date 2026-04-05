extends State
class_name StandStateEnemy

var timer : Timer = Timer.new()

func _ready() -> void:
	animation.play("stand")
	add_child(timer)
	timer.wait_time = 5 + randi()%10
	timer.start()
	timer.connect("timeout", on_timer_timeout)

func _physics_process(delta: float) -> void:
	if Global.player.position.distance_to(host.position) <= host.line_of_sight:
		host.focus = Global.player
		host.change_state("chase")
		host.call_for_help(Global.player)

func on_timer_timeout() -> void:
	host.change_state("walk")
