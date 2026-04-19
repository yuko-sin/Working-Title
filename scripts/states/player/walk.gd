extends State
class_name WalkStatePlayer

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if host.is_running:
		animation.play("run")
	else:
		animation.play("walk")
	
	host.movement_direction = Vector2.ZERO
	
	if (
		not Input.is_key_pressed(KEY_W)
		and not Input.is_key_pressed(KEY_A)
		and not Input.is_key_pressed(KEY_S)
		and not Input.is_key_pressed(KEY_D)
	):
		host.change_state("stand")
	
	if Input.is_key_pressed(KEY_W):
		host.movement_direction.y = -1
		
	if Input.is_key_pressed(KEY_A):
		host.movement_direction.x = -1
		
	if Input.is_key_pressed(KEY_S):
		host.movement_direction.y = 1
		
	if Input.is_key_pressed(KEY_D):
		host.movement_direction.x = 1
	
	host.velocity = host.movement_direction 
	
	var slowdown = (host.get_global_mouse_position() - host.position).normalized()
	
	if host.is_running:
		host.velocity = host.velocity.normalized() * host.movement_speed * 2.0
		
		
		if host.stats.stamina_current > 0.0:
			host.stats.stamina_current -= 1.0 * delta
		else:
			host.is_running = false
	else:
		host.velocity = host.velocity.normalized() * host.movement_speed
	
	if host.movement_direction.x < 0 and slowdown.x > 0 or host.movement_direction.x > 0 and slowdown.x < 0:
		host.velocity.x /= 2.0
	
	if host.movement_direction.y < 0 and slowdown.y > 0 or host.movement_direction.y > 0 and slowdown.y < 0:
		host.velocity.y /= 2.0
	
	host.move_and_slide()
