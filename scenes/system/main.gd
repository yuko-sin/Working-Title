extends Node

func _ready() -> void:
	Global.main = self
	Global.UI = $UI
	$UI.add_child(load("res://scenes/menus/mainMenu.tscn").instantiate())

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		InventoryManager.add_item(Items.generate_pistol(), Global.player.inventory)
		InventoryManager.add_item(Items.generate_machinegun(), Global.player.inventory)
		InventoryManager.add_item(Items.generate_shotgun(), Global.player.inventory)
		InventoryManager.add_item(Items.generate_sniper(), Global.player.inventory)
