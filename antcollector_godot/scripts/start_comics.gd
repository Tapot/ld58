extends Node2D

@onready var next_button: SimpleButton = $NextButton

func _ready() -> void:
	next_button.set_text("Go...")

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		go_to_next()




func go_to_next():
	Scenes.go_to_next_scene()


func _on_simple_button_pressed() -> void:
	go_to_next()
