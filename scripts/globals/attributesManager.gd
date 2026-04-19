extends Node

func increase_attributes(unit : Unit, item : Dictionary) -> void:
	if "damage_lower" in item:
		unit.damage_lower += item.damage_lower
		unit.damage_upper += item.damage_upper
	
	if "critical" in item:
		unit.critical += item.critical
	
	if "armor" in item:
		unit.armor += item.armor

func subtract_attributes(unit : Unit, item : Dictionary) -> void:
	if "damage_lower" in item:
		unit.damage_lower -= item.damage_lower
		unit.damage_upper -= item.damage_upper
	
	if "critical" in item:
		unit.critical -= item.critical
	
	if "armor" in item:
		unit.armor -= item.armor
