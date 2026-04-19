extends Node

func _ready() -> void:
	Global.main = self
	Global.UI = $UI
	$UI.add_child(load("res://scenes/menus/mainMenu.tscn").instantiate())

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		InventoryManager.add_item(Items.generate_iron_sword(), Global.player.inventory)
		InventoryManager.add_item(Items.generate_shotgun(), Global.player.inventory)
		InventoryManager.add_item(Items.generate_machinegun(), Global.player.inventory)
		InventoryManager.add_item(Items.hardBread.duplicate(), Global.player.inventory)
		InventoryManager.add_item(Items.water.duplicate(), Global.player.inventory)
		InventoryManager.add_item(Items.bandages.duplicate(), Global.player.inventory)
		InventoryManager.add_item(Items.sterileBandages.duplicate(), Global.player.inventory)
		Global.emit_signal("update")
