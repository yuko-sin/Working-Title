extends TextureRect

var stats : Array = ["stamina", "fatigue", "thirst", "hunger", "meditation", "map", "skillLevels", "encumberance", "money"]

func _ready() -> void:
	$Stats.scale /= 1.25
	for i in stats:
		var textureRect = TextureRect.new()
		textureRect.texture = load("res://assets/textures/ui/stats/" + i + ".png")
		$Stats.add_child(textureRect)
