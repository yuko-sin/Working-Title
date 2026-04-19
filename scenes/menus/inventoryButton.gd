extends Panel

func _ready() -> void:
	connect("gui_input", on_gui_input)

func on_gui_input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
		get_parent().get_parent().selected_tab = name
		Global.emit_signal("update")
		
		for child in get_parent().get_children():
			if child == self:
				child.add_theme_stylebox_override("panel", load("res://resources/inventoryTab_pressed.tres"))
			else:
				child.add_theme_stylebox_override("panel", load("res://resources/inventoryTab_normal.tres"))
