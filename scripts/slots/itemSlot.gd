extends TextureRect
class_name ItemSlot

var id
var dictionary

func _ready() -> void:
	connect("mouse_entered", on_mouse_entered)
	connect("mouse_exited", on_mouse_exited)
	
	#Busy Slot
	if dictionary[id]:
		connect("gui_input", on_gui_input)
		texture = load(dictionary[id].texture)
	
	#Quantity
	if dictionary[id] and "quantity_current" in dictionary[id] and dictionary[id].quantity_current > 0:
		get_node("Quantity").text = "x" + str(dictionary[id].quantity_current)
	else:
		if has_node("Quantity"):
			get_node("Quantity").hide()

func on_mouse_entered() -> void:
	if dictionary[id] : Popups.instance_item(dictionary[id], self)

func on_mouse_exited() -> void:
	if dictionary[id] : Popups.remove_popup()

func on_gui_input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and not event.is_pressed():
		match(dictionary[id].category):
			"equipment":
				pass
			"consumable":
				match(dictionary[id].type):
					"food":
						InventoryManager.remove_item(Global.player, dictionary, id)
						Popups.remove_popup()
						Global.emit_signal("update")
					"drink":
						InventoryManager.remove_item(Global.player, dictionary, id)
						Popups.remove_popup()
						Global.emit_signal("update")

func _get_drag_data(at_position: Vector2) -> Variant:
	var data : Dictionary = {
		"id" : id,
		"dictionary" : dictionary
	}
	
	var drag_preview = TextureRect.new()
	drag_preview.texture = texture.duplicate(4)
	drag_preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	drag_preview.custom_minimum_size = Vector2(20, 20)
	set_drag_preview(drag_preview)
	
	return data

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	#From Equipment to Inventory
	if data.dictionary == Global.player.equipment:
		#Busy Slot
		if dictionary[id]:
			var data_holder = dictionary[id]
			dictionary[id] = data.dictionary[data.id]
			EquipmentManager.take_off_item(Global.player, data.dictionary[data.id])
			EquipmentManager.equip_item(Global.player, data_holder)
			data.dictionary[data.id] = data_holder
		#Empty Slot
		else:
			dictionary[id] = data.dictionary[data.id]
			EquipmentManager.take_off_item(Global.player, data.dictionary[data.id])
			data.dictionary[data.id] = null
	
	#From Inventory to Inventory
	if dictionary == Global.player.inventory and data.dictionary == Global.player.inventory:
		#Switch Items Slots
		if dictionary[id]:
			var item_holder : Dictionary = dictionary[id]
			dictionary[id] = data.dictionary[data.id]
			data.dictionary[data.id] = item_holder
		#Change Item Slot
		else:
			dictionary[id] = data.dictionary[data.id]
			data.dictionary[data.id] = null
	
	#From Inventory to Equipment
	if dictionary == Global.player.equipment and data.dictionary == Global.player.inventory:
		if data.dictionary[data.id].category == "equipment":
			if data.dictionary[data.id].type == id:
				#Busy Slot
				if dictionary[id]:
					var data_holder : Dictionary = Global.player.equipment.weapon
					EquipmentManager.take_off_item(Global.player, Global.player.equipment.weapon)
					EquipmentManager.equip_item(Global.player, data.dictionary[data.id])
					data.dictionary[data.id] = data_holder
				#Free Slot
				else:
					EquipmentManager.equip_item(Global.player, data.dictionary[data.id])
					data.dictionary[data.id] = null
			else:
				Global.ui.instantiate_hint("Wrong slot!")
				return
		else:
			Global.ui.instantiate_hint("I can't do that!")
			return
	
	#From Loot to Inventory
	if data.dictionary not in [Global.player.equipment, Global.player.inventory]:
		if dictionary == Global.player.inventory and not dictionary[id]:
			InventoryManager.add_item_to_slot(data.dictionary[data.id], dictionary, id)
			data.dictionary[data.id] = null
			Global.emit_signal("update")
	
	Global.emit_signal("update")
