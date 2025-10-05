class_name Calendar extends Node2D

@onready var days: Label = $VBoxContainer/Days


func _ready() -> void:
	Signals.emit_next_day()
	days.text = str(GameState.current_day) + " / " + str(GameState.MAX_DAYS)


func _on_button_fight_pressed() -> void:
	on_battle_over()

func on_battle_over():
	if GameState.is_over():
		Scenes.go_to_finish_scene()
	else:
		Scenes.go_to_battle_scene()
