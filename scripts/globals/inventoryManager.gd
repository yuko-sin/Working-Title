extends Node

func add_item(item : Dictionary, inventory : Dictionary) -> void:
	for i in inventory:
		if not inventory[i]:
			inventory[i] = item
			break

func add_item_to_slot(item : Dictionary, dictionary : Dictionary, id : int) -> void:
	dictionary[id] = item
