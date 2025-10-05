extends Node2D


var timer: float = 0.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		Scenes.go_to_next_scene()


func _process(delta: float) -> void:
	timer += delta
	if timer > 3:
		Scenes.go_to_next_scene()
