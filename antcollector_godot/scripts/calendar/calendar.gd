class_name Calendar extends Node2D


@onready var fight_button: SimpleButton = $FightButton
@onready var start_tutor_button: SimpleButton = $StartTutorButton
@onready var restart_tutorial_button: RestartTutorialButton = $RestartTutorialButton
@onready var calendar_board: Node2D = $CalendarBoard


func _ready() -> void:
	setup_calendar_board()
	if GameState.is_tutor_passed:
		start_tutor_button.hide()
		fight_button.show()
		restart_tutorial_button.show()
	else:
		start_tutor_button.show()
		fight_button.hide()
		restart_tutorial_button.hide()
	
	if GameState.is_over():
		fight_button.set_text("LEAVE")
	else:
		fight_button.set_text("FIGHT")
	
	start_tutor_button.set_text("LEARN")
	Signals.emit_next_day()


func setup_calendar_board() -> void:
	if GameState.fights.size() < 1:
		return
	
	if GameState.fights.size() > 7:
		return
	
	for i in range(GameState.fights.size()):
		if GameState.fights[i]:
			calendar_board.set_success(i)
		else:
			calendar_board.set_fail(i)


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
