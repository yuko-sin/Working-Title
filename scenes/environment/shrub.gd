@tool
extends StaticBody2D

##Sets variation of the tree from 0 to 3.
@export_range(0, 3) var variation : int = 0 :
	set(new_variation):
		variation = new_variation
		$Sprite2D.region_rect = Rect2(variation * 28, 0, 28, 28)
	get:
		return variation

func _ready() -> void:
	return
	variation = randi()%3
