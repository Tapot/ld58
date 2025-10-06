extends Node2D

@onready var tutorial_taget: Area2D = $TutorialTaget
@onready var ant_bite_spawner: AntsBiteSpawner = $AntBiteSpawner
@onready var ants_spawner: AntsSpawner = $AntsSpawner
@onready var back_button: SimpleButton = $BackButton

var current_bite = "sugar"


func _ready() -> void:
	back_button.set_text("BACK")
	Scenes.current_scene = "tutorial"
	GameState.is_tutor_passed = true
	Signals.connect_attack_boss(
		on_attack_boss
	)
	Signals.connect_ant_died(
		on_ant_died
	)
	ants_spawner.spawn_ant()
	ants_spawner.spawn_ant()
	ants_spawner.spawn_ant()


func on_attack_boss(ant: Ant):
	ant.attack_boss(tutorial_taget.global_position)


func on_ant_died(_pos: Vector2):
	ants_spawner.spawn_ant()


func _on_color_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			ant_bite_spawner.spawn_ant_bite(
				event.global_position, "random"
			)


func _on_back_button_pressed() -> void:
	Scenes.go_to_next_scene()
