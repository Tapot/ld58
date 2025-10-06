class_name Calendar extends Node2D

@onready var days: Label = $VBoxContainer/Days
@onready var fight_button: SimpleButton = $FightButton
@onready var start_tutor_button: SimpleButton = $StartTutorButton
@onready var restart_tutorial_button: RestartTutorialButton = $RestartTutorialButton


func _ready() -> void:
	if GameState.is_tutor_passed:
		start_tutor_button.hide()
		fight_button.show()
		restart_tutorial_button.show()
	else:
		start_tutor_button.show()
		fight_button.hide()
		restart_tutorial_button.hide()
		
	fight_button.set_text("FIGHT")
	start_tutor_button.set_text("LEARN")
	Signals.emit_next_day()
	days.text = str(GameState.current_day) + " / " + str(GameState.MAX_DAYS)


func on_battle_over():
	if GameState.is_over():
		Scenes.go_to_finish_scene()
	else:
		Scenes.go_to_battle_scene()


func _on_start_tutorial_pressed() -> void:
	Scenes.go_to_tutorial_scene()


func _on_fight_button_pressed() -> void:
	on_battle_over()


func _on_start_tutor_button_pressed() -> void:
	Scenes.go_to_tutorial_scene()


func _on_restart_tutorial_button_pressed() -> void:
	Scenes.go_to_tutorial_scene()
