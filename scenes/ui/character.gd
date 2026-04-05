extends Panel

func _ready() -> void:
	custom_minimum_size = Vector2(208.0, 224.0)
	Global.connect("update", on_update) 
	on_update()

func _process(delta: float) -> void:
	$Attributes/Damage.text = "Damage: " + str(Global.player.damage)
	$Attributes/Armor.text = "Armor: " + str(Global.player.armor)

func on_update() -> void:
	#Equipment
	for child in $Equipment/Slots.get_children():
		child.queue_free()
	
	for i in Global.player.equipment:
		var slot = load("res://scenes/ui/itemSlot.tscn").instantiate()
		slot.set_script(load("res://scripts/slots/itemSlot.gd"))
		slot.id = i
		slot.dictionary = Global.player.equipment
		$Equipment/Slots.add_child(slot)
	
	#Inventory
	for child in $ScrollContainer/GridContainer.get_children():
		child.queue_free()
	
	for i in Global.player.inventory:
		var slot = load("res://scenes/ui/itemSlot.tscn").instantiate()
		slot.set_script(load("res://scripts/slots/itemSlot.gd"))
		slot.id = i
		slot.dictionary = Global.player.inventory
		$ScrollContainer/GridContainer.add_child(slot)

func _on_mouse_entered() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_mouse_exited() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
