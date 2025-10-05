extends Node2D

@onready var debug_panel: VBoxContainer = $CanvasLayer/DebugPanel
const ANT = preload("res://scenes/ants/ant.tscn")


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_pressed("debug"):
		debug_panel.visible = not debug_panel.visible


func spawn_ant() -> void:
	var ant = ANT.instantiate()
	ant.global_position = Screen.get_random_point_on_screen()
	add_child(ant)


func _on_spawn_ant_button_pressed() -> void:
	spawn_ant()


func _on_boss_attack_button_pressed() -> void:
	pass # Replace with function body.


func _on_next_day_button_pressed() -> void:
	Scenes.go_to_next_scene()
