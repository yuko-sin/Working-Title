@tool
extends StaticBody2D

##Sets variation of the tree from 0 to 6.
@export_range(0, 6) var variation : int = 0 :
	set(new_variation):
		variation = new_variation
		$Sprite2D.region_rect = Rect2(variation * 128, 0, 128, 128)
	get:
		return variation

func _ready() -> void:
	variation = randi()%6
