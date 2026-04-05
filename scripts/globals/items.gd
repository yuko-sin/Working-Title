extends Node

#Starting Equipment
var pistol : Dictionary = {
	"name" : "Pistol",
	"category" : "equipment",
	"type" : "weapon",
	"variation" : "gun",
	"damage" : 3,
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
	pistol.damage = 1 + randi_range(0, 2)
	pistol.fire_rate = snapped(randf_range(0.5, 1.0), 0.1)
	pistol.reload_speed = snapped(1 + randf_range(0.0, 3.0), 0.1)
	pistol.magazine_maximum = 10 + randi_range(0, 5)
	pistol.magazine_current = randi_range(0, pistol.magazine_maximum)
	pistol.icon = "res://assets/textures/icons/items/weapons/guns/pistol.png"
	pistol.model = "res://assets/textures/guns/pistol.png"
	pistol.sound_fire = "pistol"
	return pistol

#Machinegun
func generate_machinegun() -> Dictionary:
	var machinegun : Dictionary
	machinegun.name = "Machinegun"
	machinegun.category = "equipment"
	machinegun.type = "weapon"
	machinegun.variation = "gun"
	machinegun.damage = 2 + randi_range(0, 2)
	machinegun.fire_rate = snapped(randf_range(0.05, 0.1), 0.01)
	machinegun.reload_speed = snapped(1 + randf_range(0.0, 3.0), 0.1)
	machinegun.magazine_maximum = 20 + randi_range(0, 20)
	machinegun.magazine_current = randi_range(0, machinegun.magazine_maximum)
	machinegun.icon = "res://assets/textures/icons/items/weapons/guns/machinegun.png"
	machinegun.model = "res://assets/textures/guns/machinegun.png"
	machinegun.sound_fire = "machinegun"
	return machinegun

#Shotgun
func generate_shotgun() -> Dictionary:
	var shotgun : Dictionary
	shotgun.name = "Shotgun"
	shotgun.category = "equipment"
	shotgun.type = "weapon"
	shotgun.variation = "gun"
	shotgun.damage = 4 + randi_range(0, 4)
	shotgun.fire_rate = snapped(randf_range(0.1, 0.3), 0.1)
	shotgun.reload_speed = snapped(1 + randf_range(0.0, 3.0), 0.1)
	shotgun.magazine_maximum = 20 + randi_range(0, 20)
	shotgun.magazine_current = randi_range(0, shotgun.magazine_maximum)
	shotgun.icon = "res://assets/textures/icons/items/weapons/guns/shotgun.png"
	shotgun.model = "res://assets/textures/guns/shotgun.png"
	shotgun.sound_fire = "shotgun"
	return shotgun

#Sniper
func generate_sniper() -> Dictionary:
	var sniper : Dictionary
	sniper.name = "Sniper"
	sniper.category = "equipment"
	sniper.type = "weapon"
	sniper.variation = "gun"
	sniper.damage = 10 + randi_range(0, 10)
	sniper.fire_rate = snapped(randf_range(1.0, 2.0), 0.1)
	sniper.reload_speed = snapped(1 + randf_range(0.0, 3.0), 0.1)
	sniper.magazine_maximum = 5 + randi_range(0, 5)
	sniper.magazine_current = randi_range(0, sniper.magazine_maximum)
	sniper.icon = "res://assets/textures/icons/items/weapons/guns/sniper.png"
	sniper.model = "res://assets/textures/guns/sniper.png"
	sniper.sound_fire = "sniper"
	return sniper
