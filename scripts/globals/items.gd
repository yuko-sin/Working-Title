extends Node

#Starting Equipment
var pistol : Dictionary = {
	"name" : "Pistol",
	"category" : "equipment",
	"type" : "weapon",
	"variation" : "gun",
	"damage_lower" : 1,
	"damage_upper" : 2,
	"fire_rate" : 0.5,
	"reload_speed" : 1,
	"magazine_maximum" : 8,
	"magazine_current" : 8,
	"icon" : "res://assets/textures/icons/items/weapons/guns/pistol.png",
	"model" : "res://assets/textures/guns/pistol.png",
	"sound_fire" : "pistol",
}

#Pistol
func generate_pistol() -> Dictionary:
	var pistol : Dictionary
	pistol.name = "Pistol"
	pistol.category = "equipment"
	pistol.type = "weapon"
	pistol.variation = "gun"
	pistol.damage_lower = 1
	pistol.damage_upper = 1 + randi_range(0, 2)
	pistol.fire_rate = snapped(randf_range(0.5, 1.0), 0.1)
	pistol.reload_speed = snapped(1 + randf_range(0.0, 3.0), 0.1)
	pistol.magazine_maximum = 10 + randi_range(0, 5)
	pistol.magazine_current = randi_range(0, pistol.magazine_maximum)
	pistol.texture = "res://assets/textures/icons/items/weapons/guns/pistol.png"
	pistol.sound_fire = "pistol"
	pistol.weight = 3.0
	return pistol

#Machinegun
func generate_machinegun() -> Dictionary:
	var machinegun : Dictionary
	machinegun.name = "Machinegun"
	machinegun.category = "equipment"
	machinegun.type = "weapon"
	machinegun.variation = "gun"
	machinegun.damage_lower = 2
	machinegun.damage_upper = 2 + randi_range(0, 2)
	machinegun.fire_rate = snapped(randf_range(0.05, 0.1), 0.01)
	machinegun.reload_speed = snapped(1 + randf_range(0.0, 3.0), 0.1)
	machinegun.magazine_maximum = 20 + randi_range(0, 20)
	machinegun.magazine_current = randi_range(0, machinegun.magazine_maximum)
	machinegun.texture = "res://assets/textures/icons/items/weapons/guns/machinegun.png"
	machinegun.sound_fire = "machinegun"
	machinegun.weight = 10.0
	return machinegun

#Shotgun
func generate_shotgun() -> Dictionary:
	var shotgun : Dictionary
	shotgun.name = "Shotgun"
	shotgun.category = "equipment"
	shotgun.type = "weapon"
	shotgun.variation = "gun"
	shotgun.damage_lower = 1
	shotgun.damage_upper = 2 + randi_range(0, 2)
	shotgun.fire_rate = snapped(randf_range(0.1, 0.3), 0.1)
	shotgun.reload_speed = snapped(1 + randf_range(0.0, 3.0), 0.1)
	shotgun.magazine_maximum = 20 + randi_range(0, 20)
	shotgun.magazine_current = randi_range(0, shotgun.magazine_maximum)
	shotgun.texture = "res://assets/textures/icons/items/weapons/guns/shotgun.png"
	shotgun.sound_fire = "shotgun"
	shotgun.weight = 10.0
	return shotgun

#Sniper
func generate_sniper() -> Dictionary:
	var sniper : Dictionary
	sniper.name = "Sniper"
	sniper.category = "equipment"
	sniper.type = "weapon"
	sniper.variation = "gun"
	sniper.damage_lower = 4
	sniper.damage_upper = 4 + randi_range(0, 2)
	sniper.fire_rate = snapped(randf_range(1.0, 2.0), 0.1)
	sniper.reload_speed = snapped(1 + randf_range(0.0, 3.0), 0.1)
	sniper.magazine_maximum = 5 + randi_range(0, 5)
	sniper.magazine_current = randi_range(0, sniper.magazine_maximum)
	sniper.texture = "res://assets/textures/icons/items/weapons/guns/sniper.png"
	sniper.sound_fire = "sniper"
	sniper.weight = 10.0
	return sniper

##RANGED
###################################################################################################

#Iron Sword
func generate_iron_sword() -> Dictionary:
	var ironSword : Dictionary
	ironSword.name = "Iron Sword"
	ironSword.category = "equipment"
	ironSword.type = "weapon"
	ironSword.variation = "melee"
	ironSword.damage_lower = 1
	ironSword.damage_upper = 2 + randi_range(0, 2)
	ironSword.cooldown = 1.0
	ironSword.texture = "res://assets/textures/equipment/weapons/ranged/swords/ironSword.png"
	ironSword.sound_fire = "ironSword"
	ironSword.weight = 5.0
	return ironSword

##CONSUMABLES
###############################################################################

#Hard Bread
var hardBread : Dictionary = {
	"name" : "Hard Bread",
	"category" : "consumable",
	"type" : "food",
	"variation" : "bread",
	"satiation" : 10,
	"weight" : 0.25,
	"texture" : "res://assets/textures/items/consumables/hardBread.png"
}

#Water
var water : Dictionary = {
	"name" : "Water",
	"category" : "consumable",
	"type" : "drink",
	"variation" : "water",
	#"hidratation" : 10,
	"weight" : 0.5,
	"texture" : "res://assets/textures/items/consumables/water.png"
}

##MEDICINES
###############################################################################

#Bandages
var bandages : Dictionary = {
	"name" : "Bandages",
	"category" : "medicine",
	"type" : "medicine",
	"variation" : "bandages",
	#"hidratation" : 10,
	"weight" : 0.5,
	"quantity_maximum" : 5,
	"quantity_current" : 5,
	"texture" : "res://assets/textures/items/medicines/bandages.png"
}

#Sterile Bandages
var sterileBandages : Dictionary = {
	"name" : "Sterile Bandages",
	"category" : "medicine",
	"type" : "medicine",
	"variation" : "bandage",
	#"hidratation" : 10,
	"weight" : 0.5,
	"quantity_maximum" : 5,
	"quantity_current" : 5,
	"texture" : "res://assets/textures/items/medicines/sterileBandages.png"
}
