extends Node


const MAX_DAYS: int = 7
var current_day: int = 0

func _ready() -> void:
	Signals.connect_next_day(
		on_next_day
	)


func on_next_day():
	current_day += 1


func is_over() -> bool:
	return current_day >= MAX_DAYS
