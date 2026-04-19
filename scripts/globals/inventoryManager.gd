extends Node

func add_item(item : Dictionary, inventory : Dictionary) -> void:
	for i in inventory:
		if not inventory[i]:
			inventory[i] = item
			break
	
	#[?] TEST - Apply encumbrance if inventory belongs to the player
	if inventory == Global.player.inventory:
		Global.player.stats.encumbrance_current += item.weight

func remove_item(unit : Unit, inventory : Dictionary, slot : int) -> void:
	unit.stats.encumbrance_current -= inventory[slot].weight
	inventory[slot] = null

func add_item_to_slot(item : Dictionary, dictionary : Dictionary, id : int) -> void:
	dictionary[id] = item
