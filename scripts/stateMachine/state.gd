extends Node
class_name State

var host : Unit
var animation : AnimatedSprite2D

func setup(host : Unit) -> void:
	self.host = host
	self.animation = host.get_node("AnimatedSprite2D")
