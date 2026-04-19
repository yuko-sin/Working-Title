extends PanelContainer

var host
var hint : String

func _ready() -> void:
	position = host.get_global_transform_with_canvas().origin + Vector2(-size.x / 2.0, -32.0)

func _process(delta: float) -> void:
	position = host.get_global_transform_with_canvas().origin + Vector2(-size.x / 2.0, -32.0)
