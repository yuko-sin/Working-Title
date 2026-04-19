extends Panel

func _ready() -> void:
	Global.connect("update", on_update)
	on_update()

func on_update() -> void:
	for child in $Equipment.get_children():
		child.queue_free()
	
	for i in Global.player.equipment:
		var slot : TextureRect
		slot = load("res://scenes/ui/slot_equipment.tscn").instantiate()
		
		if Global.player.equipment[i]:
			slot.set_script(load("res://scripts/slots/slot_equipment_busy.gd"))
		else:
			slot.set_script(load("res://scripts/slots/slot_equipment_free.gd"))
		
		slot.id = i
		slot.dictionary = Global.player.equipment
		$Equipment.add_child(slot)

func _on_mouse_entered() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_mouse_exited() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
