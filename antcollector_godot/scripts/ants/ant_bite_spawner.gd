class_name AntsBiteSpawner extends Node2D

const ANT_BAIT = preload("res://scenes/ants/ant_bait.tscn")

var ant_bait


func spawn_ant_bite(pos: Vector2, bite_type: String) -> void:
	if not ant_bait:
		ant_bait = ANT_BAIT.instantiate()
		ant_bait.global_position = pos
		add_child(ant_bait)
		ant_bait.set_type(bite_type)
		Signals.emit_add_ant_bite(pos)
	else:
		ant_bait.die()
