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
	
	#Stats
	for i in ["damage", "armor", "fire_rate", "reload_speed"]:
		if i in item:
			var label_damage = Label.new()
			label_damage.text = i.capitalize() + ": " + str(item[i])
			label_damage.add_theme_font_size_override("font_size", 5)
			label_damage.horizontal_alignment = VERTICAL_ALIGNMENT_CENTER
			vBoxContainer.add_child(label_damage)
	
	Global.ui.add_child(panelContainer)
	panelContainer.position = slot.global_position + Vector2(24.0, 0.0)

func remove_popup() -> void:
	if is_instance_valid(panelContainer):
		panelContainer.queue_free()
