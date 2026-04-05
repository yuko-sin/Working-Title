extends Panel

var host : Unit

func _ready() -> void:
	custom_minimum_size = Vector2(80.0, 224.0)
	Global.connect("update", on_update)
	on_update()

func on_update() -> void:
	for child in $ScrollContainer/GridContainer.get_children():
		child.queue_free()
	
	for i in host.inventory:
		var slot = load("res://scenes/ui/itemSlot.tscn").instantiate()
		slot.set_script(load("res://scripts/slots/itemSlot.gd"))
		slot.id = i
		slot.dictionary = host.inventory
		$ScrollContainer/GridContainer.add_child(slot)

func _process(delta: float) -> void:
	if Global.player.position.distance_to(host.position) > 24.0:
		queue_free()

func _on_close_pressed() -> void:
	queue_free()

func _on_mouse_entered() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_mouse_exited() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
