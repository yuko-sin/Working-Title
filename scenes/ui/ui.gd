extends Control

func _ready() -> void:
	Global.ui = self
	$Magazine.hide()
	$Quantity.hide()
	await get_tree().process_frame
	for node in get_tree().get_nodes_in_group("enemy"):
		var unitInfo = load("res://scenes/ui/unitInfo.tscn").instantiate()
		unitInfo.host = node
		Global.ui.add_child(unitInfo)

func _unhandled_key_input(event: InputEvent) -> void:
	#Instance Character Menu
	if not event.is_pressed() and event.keycode == KEY_TAB:
		if $Menus.has_node("Character"):
			$Menus.get_node("Character").queue_free()
		else:
			var character = load("res://scenes/ui/character.tscn").instantiate()
			$Menus.add_child(character)
			$Menus.move_child(character, 0)
	
	#Instance System Menu
	if not event.is_pressed() and event.keycode == KEY_ESCAPE:
		if has_node("System"):
			get_node("System").queue_free()
		else:
			add_child(load("res://scenes/menus/system.tscn").instantiate())

func _process(delta: float) -> void:
	if is_instance_valid(Global.player):
		#FPS
		$FPS.text = str("FPS: " + str(Engine.get_frames_per_second()) + "/sec.")
		
		#Health
		$Bars/Health/TextureProgressBar.max_value = Global.player.health_maximum
		$Bars/Health/TextureProgressBar.value = Global.player.health_current
		$Bars/Health/Label.text = "Health " + str(Global.player.health_current) + "/" + str(Global.player.health_maximum)
		
		#Stamina
		$Bars/Stamina/TextureProgressBar.max_value = Global.player.stamina_maximum
		$Bars/Stamina/TextureProgressBar.value = Global.player.stamina_current
		$Bars/Stamina/Label.text = "Stamina " + str(Global.player.stamina_current) + "/" + str(Global.player.stamina_maximum)
		
		#Magazine
		if Global.player.equipment.weapon:
			$Magazine.show()
			$Quantity.show()
			$Quantity.text = str(Global.player.equipment.weapon.magazine_current) + "/" + str(Global.player.equipment.weapon.magazine_maximum)
			
			for child in $Magazine.get_children():
				child.queue_free()
			
			for i in Global.player.equipment.weapon.magazine_maximum:
				var textureRect = TextureRect.new()
				
				if i < Global.player.equipment.weapon.magazine_current:
					textureRect.texture = load("res://assets/textures/ui/bullet_full.png")
				else:
					textureRect.texture = load("res://assets/textures/ui/bullet_empty.png")
				
				$Magazine.add_child(textureRect)
				$Magazine.move_child(textureRect, 0)
		else:
			$Magazine.hide()
			$Quantity.hide()

func instantiate_hint(text : String) -> void:
	if has_node("Hint"):
		get_node("Hint").call_deferred("free")
	
	var hint = load("res://scenes/ui/hint.tscn").instantiate()
	hint.text = text
	call_deferred("add_child", hint)

func instantiate_damage_popup(value : int, target : Unit) -> void:
	var damagePopup = load("res://scenes/ui/damagePopup.tscn").instantiate()
	damagePopup.text = "-" + str(value)
	damagePopup.position = target.get_global_transform_with_canvas().origin
	Global.ui.add_child(damagePopup)

func instantiate_loot(unit : Unit) -> void:
	if $Menus.has_node("Loot"):
		$Menus.get_node("Loot").queue_free()
	else:
		var loot = load("res://scenes/ui/loot.tscn").instantiate()
		loot.host = unit
		$Menus.add_child(loot)
