extends Node


const MAX_DAYS: int = 7
var current_day: int = 0
var current_boss_index: int = 2

var is_tutor_passed: bool = false
var bosses_hp = [
	50, 50, 200
]
var ants_dies: int = 0
var fights = []

func _ready() -> void:
	Signals.connect_next_day(
		on_next_day
	)
	Signals.connect_ant_died(
		on_ant_died
	)


func on_ant_died(_pos: Vector2) -> void:
	ants_dies += 1


func on_next_day():
	current_day += 1


func add_fight_results(success: bool):
	fights.append(success)


func is_over() -> bool:
	if current_day >= MAX_DAYS:
		return true
	elif current_boss_index > 2:
		return true
	else:
		return false
