extends Node

func increase_attributes(unit : Unit, item : Dictionary) -> void:
	if "damage" in item:
		unit.damage += item.damage
	
	if "armor" in item:
		unit.armor += item.armor

func subtract_attributes(unit : Unit, item : Dictionary) -> void:
	if "damage" in item:
		unit.damage -= item.damage
	
	if "armor" in item:
		unit.armor -= item.armor
