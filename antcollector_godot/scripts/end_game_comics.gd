extends Node2D

@onready var next_button: SimpleButton = $NextButton
@onready var label_2: Label = $Label2
@onready var restart_button: SimpleButton = $RestartButton

var _counter : int = 0


func _ready():
	restart_button.hide()
	restart_button.set_text("AGAIN")
	Scenes.current_scene = "end_game_comics"
	next_button.set_text("OK")
	go_to_next_record()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		go_to_next_record()


func _on_next_button_pressed() -> void:
	go_to_next_record()


func go_to_next_record():
	var death_log = GameState.collections_log.pick_random()
	# Ant "UNKNOWN" DIED AT SUNDAY DEATH REASON: JAR
	label_2.text = "Ant: " + death_log["name"] + "\nDIED AT " + death_log["day"] + "\nDEATH REASON: " + death_log["death_reason"]
	_counter += 1
	
	if _counter > 5:
		restart_button.show()


func _on_restart_button_pressed() -> void:
	Scenes.go_to_next_scene()
