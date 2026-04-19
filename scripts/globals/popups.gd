extends Node

var panelContainer : PanelContainer

func instance_item(item : Dictionary, slot : TextureRect) -> void:
	panelContainer = PanelContainer.new()
	panelContainer.theme = load("res://resources/theme_popup.tres")
	var vBoxContainer = VBoxContainer.new()
	vBoxContainer.set("theme_override_constants/separation", 0)
	panelContainer.add_child(vBoxContainer)
	
	#Name
	var label_name = Label.new()
	label_name.text = item.name
	label_name.add_theme_font_size_override("font_size", 8)
	label_name.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
	vBoxContainer.add_child(label_name)
	
	#Category, Type, Variation
	var label_info = Label.new()
	label_info.text = item.category.capitalize() + " / " + item.type.capitalize() + " / " + item.variation.capitalize() 
	label_info.add_theme_font_size_override("font_size", 4)
	label_info.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
	label_info.custom_minimum_size.x = 64.0
	vBoxContainer.add_child(label_info)
	
	#[?]Damage
	if "damage_lower" in item:
		var label_damage = Label.new()
		label_damage.text = "Damage " + str(item.damage_lower) + "-" + str(item.damage_upper)
		label_damage.add_theme_font_size_override("font_size", 5)
		label_damage.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
		vBoxContainer.add_child(label_damage)
	
	#[?]Saturation
	if "satiation" in item:
		var label_satiation = Label.new()
		label_satiation.text = "Increase satiation by "  + str(item.satiation) + "."
		label_satiation.add_theme_font_size_override("font_size", 5)
		label_satiation.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
		vBoxContainer.add_child(label_satiation)
	
	#[?]Hidratation
	if "hidratation" in item:
		var label_hidratation = Label.new()
		label_hidratation.text = "Increase hidratation by "  + str(item.hidratation) + "."
		label_hidratation.add_theme_font_size_override("font_size", 5)
		label_hidratation.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
		vBoxContainer.add_child(label_hidratation)
	
	#Stats
	for i in ["armor", "fire_rate", "reload_speed"]:
		if i in item:
			var label_stat = Label.new()
			label_stat.text = i.capitalize() + ": " + str(item[i])
			label_stat.add_theme_font_size_override("font_size", 5)
			label_stat.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
			vBoxContainer.add_child(label_stat)
	
	#[?]Hint
	match(item.category):
		"consumable":
			var label_hint = Label.new()
			label_hint.text = "[Right-mouse click] - to use."
			label_hint.add_theme_font_size_override("font_size", 4)
			label_hint.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
			vBoxContainer.add_child(label_hint)
	
	Global.ui.add_child(panelContainer)
	panelContainer.position = slot.global_position + Vector2(24.0, 0.0)

func instantiate_menus_buttons(button : Panel) -> void:
	panelContainer = PanelContainer.new()
	panelContainer.theme = load("res://resources/theme_popup.tres")
	var vBoxContainer = VBoxContainer.new()
	vBoxContainer.set("theme_override_constants/separation", 0)
	panelContainer.add_child(vBoxContainer)
	
	#Title
	var label_title = Label.new()
	label_title.text = button.name
	label_title.add_theme_font_size_override("font_size", 6)
	label_title.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
	vBoxContainer.add_child(label_title)
	
	var label_info = Label.new()
	label_info.add_theme_font_size_override("font_size", 5)
	label_info.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
	label_info.custom_minimum_size.x = 64.0
	vBoxContainer.add_child(label_info)
	
	match(button.name.to_lower()):
		"character":
			label_title.text += " [C]"
			label_info.text = "Opens up character's menu showing equipment and attributes."
		"inventory":
			label_title.text += " [I]"
			label_info.text = "Opens inventory."
		"system":
			label_title.text += " [ESC]"
			label_info.text = "Shows the system menu and pauses the game."
	
	Global.ui.add_child(panelContainer)
	panelContainer.position = button.global_position - Vector2(panelContainer.size.x / 2.0, panelContainer.size.y)

func remove_popup() -> void:
	if is_instance_valid(panelContainer):
		panelContainer.queue_free()
