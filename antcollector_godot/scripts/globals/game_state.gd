extends Node


const MAX_DAYS: int = 7
var current_day: int = 0
var current_boss_index: int = 0

var is_tutor_passed: bool = false


func _ready() -> void:
	Signals.connect_next_day(
		on_next_day
	)


func on_next_day():
	current_day += 1


func is_over() -> bool:
	if current_day >= MAX_DAYS:
		return true
	elif current_boss_index > 2:
		return true
	else:
		return false
