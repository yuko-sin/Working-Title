extends Node

signal update

var main : Node
var UI : CanvasLayer
var ui : Control
var area : Node2D
var player : Unit

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_taunted_units()

## SAVE/LOAD SYSTEM
###############################################################################
var save_path : String = "user://game.save"

func save_game() -> void:
	get_taunted_units()
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(player.spawn_point)
	file.store_var(player.stats)
	file.store_var(player.equipment)
	file.store_var(player.taunts)
	file.close()

func load_game() -> void:
	var file = FileAccess.open(save_path, FileAccess.READ)
	player.spawn_point  = file.get_var()
	player.stats  = file.get_var()
	player.equipment  = file.get_var()
	player.taunts = file.get_var()
	file.close()

func get_taunted_units() -> void:
	for i in get_tree().get_nodes_in_group("enemy"):
		if i.focus == Global.player:
			player.taunts[player.taunts.size()] = {
				"unit_path" : i.scene_file_path,
				"unit_stats" : i.stats,
				"distance" : i.position.distance_to(Global.player.position)
			}
