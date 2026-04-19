extends Control

var selected_tab : String = "All"

func _ready() -> void:
	Global.connect("update", on_update)
	on_update()
	Audio.instance_sound("menu")

func on_update() -> void:
	##Inventory Slots
	###########################################################################
	for child in $ScrollContainer/GridContainer.get_children():
		child.queue_free()
	
	match(selected_tab):
		"All":
			for i in Global.player.inventory:
				var itemSlot = load("res://scenes/ui/itemSlot.tscn").instantiate()
				if Global.player.inventory[i]: itemSlot.set_script(load("res://scripts/slots/slot_inventory_busy.gd"))
				else: itemSlot.set_script(load("res://scripts/slots/slot_inventory_free.gd"))
				itemSlot.dictionary = Global.player.inventory
				itemSlot.id = i
				$ScrollContainer/GridContainer.add_child(itemSlot)
		"Weapons":
			for i in Global.player.inventory:
				if Global.player.inventory[i] and Global.player.inventory[i].type == "weapon":
					var itemSlot = load("res://scenes/ui/itemSlot.tscn").instantiate()
					itemSlot.set_script(load("res://scripts/slots/slot_inventory_busy.gd"))
					itemSlot.dictionary = Global.player.inventory
					itemSlot.id = i
					$ScrollContainer/GridContainer.add_child(itemSlot)
		"Consumables":
			for i in Global.player.inventory:
				if Global.player.inventory[i] and Global.player.inventory[i].type in ["food", "drink"]:
					var itemSlot = load("res://scenes/ui/itemSlot.tscn").instantiate()
					itemSlot.set_script(load("res://scripts/slots/slot_inventory_busy.gd"))
					itemSlot.dictionary = Global.player.inventory
					itemSlot.id = i
					$ScrollContainer/GridContainer.add_child(itemSlot)
		"Medicines":
			for i in Global.player.inventory:
				if Global.player.inventory[i] and Global.player.inventory[i].type == "medicine":
					var itemSlot = load("res://scenes/ui/itemSlot.tscn").instantiate()
					itemSlot.set_script(load("res://scripts/slots/slot_inventory_busy.gd"))
					itemSlot.dictionary = Global.player.inventory
					itemSlot.id = i
					$ScrollContainer/GridContainer.add_child(itemSlot)
	
	##Load
	###########################################################################
	$Load/Load/TextureProgressBar.max_value = Global.player.stats.encumbrance_maximum
	$Load/Load/TextureProgressBar.value = Global.player.stats.encumbrance_current
	$Load/HBoxContainer/Label.text = str(Global.player.stats.encumbrance_current) + "/" + str(Global.player.stats.encumbrance_maximum)

func _on_mouse_entered() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_mouse_exited() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_tree_exited() -> void:
	Audio.instance_sound("menu")
