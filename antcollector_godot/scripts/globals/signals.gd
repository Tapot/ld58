extends Node

signal start_game
signal next_day


func emit_start_game() -> void:
	start_game.emit()


func connect_start_game(collable: Callable) -> void:
	start_game.connect(collable)


func emit_next_day() -> void:
	next_day.emit()


func connect_next_day(collable: Callable) -> void:
	next_day.connect(collable)
