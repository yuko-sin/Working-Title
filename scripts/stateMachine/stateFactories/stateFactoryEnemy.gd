extends StateFactory
class_name StateFactoryEnemy

func _init():
	states = {
		"stand" : StandStateEnemy,
		"walk" : WalkStateEnemy,
		"chase" : ChaseStateEnemy,
		"death" : DeathStateEnemy
	}
