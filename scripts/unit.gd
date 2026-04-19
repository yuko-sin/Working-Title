extends CharacterBody2D
class_name Unit

var unit : String

var stats : Dictionary = {
	"health_maximum" : 0,
	"health_current" : 0,
	"stamina_maximum" : 0,
	"stamina_current" : 0,
	"fatigue_maximum" : 0,
	"fatigue_current" : 0,
	"thirst_maximum" : 0,
	"thirst_current" : 0,
	"hunger_maximum" : 0,
	"hunger_current" : 0,
	"meditation_maximum" : 0,
	"meditation_current" : 0,
	"map_maximum" : 0,
	"map_current" : 0,
	"skillLevels_maximum" : 0,
	"skillLevels_current" : 0,
	"encumbrance_maximum" : 50.0,
	"encumbrance_current" : 0,
	"money_maximum" : 0,
	"money_current" : 0,
}

var focus : Unit
var stateFactory : StateFactory
var state
var movement_direction : Vector2
#var facing_direction : Vector2i
var movement_speed : int = 40
var damage_lower : int = 0
var damage_upper : int = 0
var armor : int = 0
var critical : int = 0

var equipment : Dictionary = {
	"head" : null,
	"chest" : null,
	"armor" : null,
	"legs" : null,
	"feet" : null,
	"weapon" : null
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
