extends Node


var scenes: Dictionary = {
	"start": preload("res://scenes/start_game_main.tscn"),
	"start_comics": preload("res://scenes/start_comics.tscn"),
	"battle_splash": preload("res://scenes/battle_splash.tscn"),
	"calendar": preload("res://scenes/calendar.tscn"),
	"battle": preload("res://scenes/battle.tscn"),
	"tutorial": preload("res://scenes/tutorial.tscn"),
	"end_game_comics": preload("res://scenes/end_game_comics.tscn"),
}

var current_scene: String = "start"

var next_scenes: Dictionary = {
	"start": "start_comics",
	"start_comics": "calendar",
	"calendar": "battle_splash",
	"battle_splash": "battle",
	"battle": "calendar",
	"tutorial": "calendar",
	"end_game_comics": "start",
}


func go_to_next_scene(scene_name: String = "") -> void:
	if not scene_name:
		scene_name = next_scenes[current_scene]
	current_scene = scene_name
	get_tree().call_deferred(
		"change_scene_to_packed",
		scenes[current_scene]
	)


func go_to_battle_scene() -> void:
	go_to_next_scene("battle_splash")

func go_to_finish_scene() -> void:
	go_to_next_scene("end_game_comics")

func go_to_tutorial_scene() -> void:
	go_to_next_scene("tutorial")
