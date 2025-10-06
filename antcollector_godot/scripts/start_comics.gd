extends Node2D

const WAIT_TO_NEXT_SEC: float = 3.0
var timer: float = 0.0


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		go_to_next()


func _process(delta: float) -> void:
	timer += delta
	if timer > WAIT_TO_NEXT_SEC:
		go_to_next()


func go_to_next():
	Scenes.go_to_next_scene()
