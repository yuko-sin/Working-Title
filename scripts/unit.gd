extends CharacterBody2D
class_name Unit

var unit : String
var focus : Unit
var stateFactory : StateFactory
var state
var movement_direction : Vector2
#var facing_direction : Vector2i
var health_maximum : int = 100
var health_current : int = 100
var stamina_maximum : int = 100
var stamina_current : int = 100
var food_maximum : int
var food_current : int
var water_maximum : int
var water_current : int
var movement_speed : int = 40
var damage : int = 0
var armor : int = 0

var equipment : Dictionary = {
	"weapon" : null,
	"armor" : null
}

var inventory : Dictionary = {}

func change_state(new_state_name):
	if not state == null:
		state.queue_free()
	
	if stateFactory:
		state = stateFactory.get_state(new_state_name).new()
		state.setup(self)
		state.name = new_state_name
		add_child(state)
