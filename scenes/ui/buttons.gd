extends HBoxContainer

func _ready() -> void:
	for child in get_children():
		child.connect("mouse_entered", on_button_mouse_entered.bind(child))
		child.connect("mouse_exited", on_button_mouse_exited.bind(child))

func _unhandled_key_input(event: InputEvent) -> void:
	if not event.is_pressed():
		match(event.keycode):
			KEY_C:
				Global.ui.instantiate_character()
			KEY_I:
				Global.ui.instantiate_inventory()
			KEY_ESCAPE:
				Global.ui.instantiate_system()

func on_button_mouse_entered(button : Panel) -> void:
	Popups.instantiate_menus_buttons(button)

func on_button_mouse_exited(button : Panel) -> void:
	Popups.remove_popup()

func _on_mouse_entered() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_mouse_exited() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_character_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
		Global.ui.instantiate_character()

func _on_inventory_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
		Global.ui.instantiate_inventory()

func _on_system_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
		Global.ui.instantiate_system()
