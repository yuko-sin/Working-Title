extends Sprite2D

func _ready() -> void:
	flip_h = true
	Global.connect("update", on_update)
	await get_tree().process_frame
	on_update()

func on_update() -> void:
	if Global.player.equipment.weapon:
		texture = load(Global.player.equipment.weapon.model)
		$Cooldown.wait_time = Global.player.equipment.weapon.fire_rate
	else:
		texture = null

func _process(delta: float) -> void:
	#Gun's Visuals
	if get_global_mouse_position().x > global_position.x:
		flip_v = false
	else:
		flip_v = true
	
	if get_global_mouse_position().y < global_position.y:
		show_behind_parent = true
	else:
		show_behind_parent = false
	
	look_at(get_global_mouse_position())

	#Shooting Process
	if get_parent().is_shooting:
		if $Cooldown.is_stopped():
			if Global.player.equipment.weapon.magazine_current:
				var bullet = load("res://scenes/objects/bullet/bullet.tscn").instantiate()
				bullet.host = Global.player
				
				var spawn : float
				
				if Global.player.velocity == Vector2.ZERO:
					spawn = 2.0
				else:
					spawn = 4.0
				
				bullet.position = Global.player.position + Vector2(randf_range(-spawn, spawn), randf_range(-spawn, spawn))
				
				var precision : float
				
				if Global.player.velocity == Vector2.ZERO:
					precision = 4.0
				else:
					precision = 16.0
				
				bullet.direction = (get_global_mouse_position() - (Global.player.position + Vector2(randf_range(-precision, precision), randf_range(-precision, precision)))).normalized()
				
				Global.world.add_child(bullet)
				$Cooldown.start()
				Global.player.equipment.weapon.magazine_current -= 1
				Audio.instance_sound(Global.player.equipment.weapon.sound_fire)
			else:
				get_parent().is_shooting = false
				Global.ui.instantiate_hint("I need to reload!")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			if Global.player.equipment.weapon:
				get_parent().is_shooting = true
			else:
				Global.ui.instantiate_hint("I need a waepon!")
		else:
			get_parent().is_shooting = false
