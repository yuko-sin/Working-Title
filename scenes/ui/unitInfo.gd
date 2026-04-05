extends VBoxContainer

var host : Unit

func _ready() -> void:
	position = host.get_global_transform_with_canvas().origin + Vector2(-size.x / 2.0, -24.0)
	$Label.text = host.unit
	$TextureProgressBar.max_value = host.health_maximum

func _process(delta: float) -> void:
	if is_instance_valid(host):
		position = host.get_global_transform_with_canvas().origin + Vector2(-size.x / 2.0, -24.0)
		$TextureProgressBar.value = host.health_current
		
		if host.health_current == 0:
			$Label.text = "Loot [E]"
			
			if Global.player.position.distance_to(host.position) < 16.0:
				show()
			else:
				hide()
	else:
		queue_free()
