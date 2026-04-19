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

func _process(delta: float) -> void:
	##FPS
	$FPS.text = str("FPS: " + str(Engine.get_frames_per_second()) + "/sec.")
	
	#if is_instance_valid(Global.player):
		##Magazine
		#if Global.player.equipment.weapon:
			#$Magazine.show()
			#$Quantity.show()
			#$Quantity.text = str(Global.player.equipment.weapon.magazine_current) + "/" + str(Global.player.equipment.weapon.magazine_maximum)
			#
			#for child in $Magazine.get_children():
				#child.queue_free()
			#
			#for i in Global.player.equipment.weapon.magazine_maximum:
				#var textureRect = TextureRect.new()
				#
				#if i < Global.player.equipment.weapon.magazine_current:
					#textureRect.texture = load("res://assets/textures/ui/bullet_full.png")
				#else:
					#textureRect.texture = load("res://assets/textures/ui/bullet_empty.png")
				#
				#$Magazine.add_child(textureRect)
				#$Magazine.move_child(textureRect, 0)
		#else:
			#$Magazine.hide()
			#$Quantity.hide()

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

func instantiate_trigger_hint(object, hint : String) -> void:
	if has_node("TriggerHint"):
		get_node("TriggerHint").queue_free()
	else:
		var triggerHint = load("res://scenes/ui/TriggerHint.tscn").instantiate()
		triggerHint.host = object
		triggerHint.hint = hint
		add_child(triggerHint)

func remove_trigger_hint() -> void:
	if has_node("TriggerHint"):
		get_node("TriggerHint").queue_free()

func transit(scene : String) -> void:
	queue_free()
	
	var transit = load("res://scenes/ui/transit.tscn").instantiate()
	transit.scene = scene
	Global.UI.add_child(transit)

func instantiate_character() -> void:
	if $Menus.has_node("Character"):
		$Menus.get_node("Character").queue_free()
	else:
		$Menus.add_child(load("res://scenes/ui/character.tscn").instantiate())

func instantiate_inventory() -> void:
	if $Menus.has_node("Inventory"):
		$Menus.get_node("Inventory").queue_free()
	else:
		$Menus.add_child(load("res://scenes/ui/inventory.tscn").instantiate())

func instantiate_system() -> void:
	if $Menus.get_child_count() > 0:
		for child in $Menus.get_children():
			child.queue_free()
	else:
		if has_node("System"):
			get_node("System").queue_free()
		else:
			add_child(load("res://scenes/menus/system.tscn").instantiate())
