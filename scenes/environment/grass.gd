@tool
extends Area2D

##Sets variation of the tree from 0 to 24.
@export_range(0, 4) var variation : int = 0 :
	set(new_variation):
		variation = new_variation
		$Sprite2D.region_rect = Rect2(variation * 16, 0, 16, 16)
	get:
		return variation

func _ready() -> void:
	variation = randi()%24
