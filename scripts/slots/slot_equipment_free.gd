extends ItemSlot

func _ready() -> void:
		get_node("Icon").texture = load("res://assets/textures/icons/equipment/" + id + ".png")

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if not data.dictionary[data.id].type == id:
		Global.ui.instantiate_hint("Wrong slot!")
		return
	
	Global.player.equipment[id] = data.dictionary[data.id]
	AttributesManager.increase_attributes(Global.player, data.dictionary[data.id])
	data.dictionary[data.id] = null
	Global.emit_signal("update")
	
