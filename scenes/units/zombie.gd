extends Unit
class_name Enemy

var help_call : bool = true
var help_call_range : int = 64
var line_of_sight : int = 128

func _ready() -> void:
	add_to_group("enemy")
	unit = "Zombie"
	health_maximum = 5 + randi_range(0, 5)
	health_current = health_maximum
	damage = 5
	armor = 0
	movement_speed = 20
	stateFactory = StateFactoryEnemy.new()
	change_state("stand")
	
	#Create inentory slots and loot
	for i in range(randi()%3):
		inventory[i] = null
		var array : Array = ["pistol", "machinegun", "shotgun", "sniper"]
		InventoryManager.add_item(Items.call("generate_" + array.pick_random()), inventory)

func _process(delta: float) -> void:
	if movement_direction.x > 0.0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true

func call_for_help(target : Unit) -> void:
	for node in get_tree().get_nodes_in_group("enemy"):
		if not node.state.name == "chase":
			if not node == self and node.position.distance_to(position) <= help_call_range:
				if node.health_current > 0:
					node.focus = target
					node.change_state("chase")

func _unhandled_key_input(event: InputEvent) -> void:
	if event.keycode == KEY_E and not event.is_pressed():
		if state.name == "death":
			if not position.distance_to(Global.player.position) >= 16.0:
				var is_loot : bool
				
				for i in inventory:
					if inventory[i]:
						is_loot = true
						break
				
				if is_loot:
					Global.ui.instantiate_loot(self)
				else:
					Global.ui.instantiate_hint("There isn't loot!")
