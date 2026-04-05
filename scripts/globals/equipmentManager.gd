extends Node

func equip_item(unit : Unit, item : Dictionary) -> void:
	if unit.equipment[item.type]:
		take_off_item(unit, item)
	
	unit.equipment[item.type] = item
	AttributesManager.increase_attributes(unit, item)

func take_off_item(unit : Unit, item : Dictionary) -> void:
	unit.equipment[item.type] = null
	AttributesManager.subtract_attributes(unit, item)
