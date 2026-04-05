extends Node2D

var map_size = Vector2i(128, 128)
var busy_cells : Array

func _ready() -> void:
	Global.world = self
	
	#Set Terrain
	for x in range(map_size.x):
		for y in range(map_size.y):
			$Terrain.set_cell(Vector2i(x, y), 0, Vector2i(0, 0), 0)
	
	#Set Player
	var player = load("res://scenes/units/player.tscn").instantiate()
	var random_cell = $Terrain.get_used_cells().pick_random()
	player.position = $Terrain.to_global(random_cell)
	add_child(player)
	
	#Set Crosshair
	add_child(load("res://scenes/ui/crosshair.tscn").instantiate())
	Audio.instance_music("forest")
	
	#Set Rocks/Trees/Shrubs
	for cell in $Terrain.get_used_cells():
		if not cell in busy_cells:
			if randi()%300 < 1:
				busy_cells.append(cell)
				var array : Array = ["stone", "shrub", "tree", "logs"]
				var tree = load("res://scenes/environment/" + array.pick_random() + ".tscn").instantiate()
				tree.position = $Terrain.map_to_local(cell)
				tree.variation = randi()%6
				add_child(tree)
	
	#Set Grass
	for cell in $Terrain.get_used_cells():
		if not cell in busy_cells:
			if randi()%100 < 1:
				busy_cells.append(cell)
				var grass = load("res://scenes/environment/grass.tscn").instantiate()
				grass.position = $Terrain.map_to_local(cell)
				add_child(grass)
	
	#Set Enemies
	for cell in $Terrain.get_used_cells():
		if not cell in busy_cells:
			if randi()%500 < 1:
				var random_position : Vector2 = $Terrain.map_to_local(cell)
				
				if random_position.distance_to(Global.player.position) > 128.0:
					var zombie = load("res://scenes/units/zombie.tscn").instantiate()
					zombie.position = $Terrain.map_to_local(cell)
					add_child(zombie)
