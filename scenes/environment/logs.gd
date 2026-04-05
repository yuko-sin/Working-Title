@tool
extends StaticBody2D

##Sets variation of the tree from 0 to 4.
@export_range(0, 4) var variation : int = 0 :
	set(new_variation):
		variation = new_variation
		$Sprite2D.region_rect = Rect2(variation * 32, 0, 32, 32)
	get:
		return variation

func _ready() -> void:
	variation = randi()%4
