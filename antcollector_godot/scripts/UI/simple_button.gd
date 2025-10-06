class_name SimpleButton extends TextureButton

var _init_pos: Vector2

@onready var text_label: Label = $TextLabel


func _ready() -> void:
	_init_pos = global_position

func _on_mouse_entered() -> void:
	global_position += Vector2(-10, -10)

func _on_mouse_exited() -> void:
	global_position = _init_pos

func set_text(value: String) -> void:
	text_label.text = value
