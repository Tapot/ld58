class_name AntsSpawner extends Node2D

const ANT = preload("res://scenes/ants/ant.tscn")


func spawn_ant() -> void:
	var ant = ANT.instantiate()
	ant.global_position = Screen.get_random_point_on_screen()
	call_deferred("add_child", ant)


func is_all_died() -> bool:
	return get_children().size() < 1
