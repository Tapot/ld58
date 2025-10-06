extends Node

signal start_game
signal next_day
signal attack_boss(ant: Ant)
signal damage_boss(damage: float)
signal add_ant_bite(pos: Vector2)
signal ant_bite_appears(pos: Vector2)
signal ant_died(ant_name: String, reason: String, pos: Vector2)
signal ant_bite_disappears


func emit_start_game() -> void:
	start_game.emit()

func connect_start_game(collable: Callable) -> void:
	start_game.connect(collable)


func emit_next_day() -> void:
	next_day.emit()


func connect_next_day(collable: Callable) -> void:
	next_day.connect(collable)


func emit_attack_boss(ant: Ant) -> void:
	attack_boss.emit(ant)

func connect_attack_boss(collable: Callable) -> void:
	attack_boss.connect(collable)


func emit_damage_boss(damage: float) -> void:
	damage_boss.emit(damage)

func connect_damage_boss(collable: Callable) -> void:
	damage_boss.connect(collable)


func emit_add_ant_bite(pos: Vector2) -> void:
	add_ant_bite.emit(pos)

func connect_add_ant_bite(collable: Callable) -> void:
	add_ant_bite.connect(collable)


func emit_ant_bite_appears(pos: Vector2) -> void:
	ant_bite_appears.emit(pos)

func connect_ant_bite_appears(collable: Callable) -> void:
	ant_bite_appears.connect(collable)


func emit_ant_died(ant_name: String, reason: String, pos: Vector2) -> void:
	ant_died.emit(ant_name, reason, pos)

func connect_ant_died(collable: Callable) -> void:
	ant_died.connect(collable)


func emit_ant_bite_disappears() -> void:
	ant_bite_disappears.emit()

func connect_ant_bite_disappears(collable: Callable) -> void:
	ant_bite_disappears.connect(collable)
