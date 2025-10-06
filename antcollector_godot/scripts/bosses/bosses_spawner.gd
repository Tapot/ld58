class_name BossesSpawner extends Node2D


const BOSS_ANTIE = preload("res://scenes/bosses/boss_antie.tscn")
const BOSS_MAMA_ROACH = preload("res://scenes/bosses/boss_mama_roach.tscn")
const BOSS_METAL_LEAK_A = preload("res://scenes/bosses/boss_metal_leak_a.tscn")

var _boss
var _bosses = [
	BOSS_ANTIE,
	BOSS_MAMA_ROACH,
	BOSS_METAL_LEAK_A,
]


func spawn_boss(boss_index: int) -> void:
	if not _boss:
		_boss = _bosses[boss_index].instantiate()
		add_child(_boss)


func get_boss_position() -> Vector2:
	if _boss:
		return _boss.global_position
	else:
		return Screen.get_random_point_on_screen()
