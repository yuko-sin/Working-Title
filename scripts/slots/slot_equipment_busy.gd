extends ItemSlot

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if not data.dictionary[data.id].type == id:
		Global.ui.instantiate_hint("Wrong slot!")
		return
	
	var item_holder = dictionary[id]
	AttributesManager.subtract_attributes(Global.player, dictionary[id])
	Global.player.equipment[id] = data.dictionary[data.id]
	AttributesManager.increase_attributes(Global.player, data.dictionary[data.id])
	data.dictionary[data.id] = item_holder
	Global.emit_signal("update")
	
