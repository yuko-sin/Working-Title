extends Control

func _ready() -> void:
	Global.connect("update", on_update) 
	on_update()
	Audio.instance_sound("menu")

func on_update() -> void:
	pass

func _process(delta: float) -> void:
	$RichTextLabel.clear()
	$RichTextLabel.add_text("Damage: " + str(Global.player.damage_lower) + "-" + str(Global.player.damage_upper))
	$RichTextLabel.add_text("\nCritical: " + str(Global.player.critical) + "%")
	$RichTextLabel.add_text("\nArmor: " + str(Global.player.armor) + " (Absorbs 0%)")

func _on_mouse_entered() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_mouse_exited() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_equipment_mouse_entered() -> void:
	pass

func _on_tree_exited() -> void:
	Audio.instance_sound("menu")
