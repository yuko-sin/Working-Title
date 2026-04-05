extends GPUParticles2D

func _process(delta: float) -> void:
	var is_loot : bool
	
	for i in get_parent().inventory:
		if get_parent().inventory[i]:
			is_loot = true
			break
	
	if not is_loot:
		queue_free()
