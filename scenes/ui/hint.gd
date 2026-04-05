extends Label

func _ready() -> void:
	position = Global.player.get_global_transform_with_canvas().origin + Vector2(-size.x / 2.0, -32.0)

func _process(delta: float) -> void:
	position = Global.player.get_global_transform_with_canvas().origin + Vector2(-size.x / 2.0, -32.0)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
