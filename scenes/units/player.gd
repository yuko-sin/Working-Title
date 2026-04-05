extends Unit

var is_shooting : bool
var is_running : bool
var is_running_pressed : bool

func _ready() -> void:
	Global.player = self
	stateFactory = StateFactoryPlayer.new()
	change_state("stand")
	for i in range(60): inventory[i] = null
	
	#Starting Equipment
	equipment.weapon = Items.pistol
	AttributesManager.increase_attributes(self, equipment.weapon)

func _process(delta: float) -> void:
	if is_shooting:
		if (get_global_mouse_position() - position).normalized().x > 0.0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
	else:
		if movement_direction.x > 0.0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true

func _unhandled_key_input(event: InputEvent) -> void:
	#Run
	if event.keycode == KEY_SHIFT:
		if event.is_pressed():
			if not is_running_pressed:
				is_running_pressed = true
				is_running = true
		else:
			is_running_pressed = false
			is_running = false
	
	#Reload
	if event.keycode == KEY_R:
		if not event.is_pressed():
			if Global.player.equipment.weapon:
				Global.player.equipment.weapon.magazine_current = Global.player.equipment.weapon.magazine_maximum
				Audio.instance_sound2D("reload", position)

func _on_timer_timeout() -> void:
	if not is_running:
		if stamina_current < stamina_maximum:
			stamina_current += 1
