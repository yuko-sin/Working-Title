extends Node2D
class_name Area

var area_name : String = "Unknown Area"

func _ready() -> void:
	Global.area = self
	if has_method("initialize"): call("initialize")
	
	## Instantiate Player
	###########################################################################
	add_child(load("res://scenes/units/player.tscn").instantiate())

func _process(delta: float) -> void:
	return
	### Instantiate Taunted Units
	############################################################################
	for i in Global.player.taunts:
		var unit = load(Global.player.taunts[i].unit_path).instantiate()
		unit.stats = Global.player.taunts[i].unit_stats
		unit.position = Vector2(randf_range(-128.0, 128.0), randf_range(-128.0, 128.0))
		Global.area.add_child(unit)
		Global.player.taunts.erase(i)
