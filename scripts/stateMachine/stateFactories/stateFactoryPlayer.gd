extends StateFactory
class_name StateFactoryPlayer

func _init():
	states = {
		"stand" : StandStatePlayer,
		"walk" : WalkStatePlayer,
	}
