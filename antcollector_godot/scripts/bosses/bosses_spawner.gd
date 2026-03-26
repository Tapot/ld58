class_name BossesSpawner extends Node2D

const BOSS_ANTIE: PackedScene = preload("res://scenes/bosses/boss_antie.tscn")
const BOSS_MAMA_ROACH: PackedScene = preload("res://scenes/bosses/boss_mama_roach.tscn")
const BOSS_FLY: PackedScene = preload("res://scenes/bosses/boss_fly.tscn")

var _boss: Node2D
var _bosses: Array[PackedScene] = [
	BOSS_ANTIE,
	BOSS_FLY,
	BOSS_MAMA_ROACH,
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


func kill_the_boss() -> void:
	if _boss:
		_boss.die()


func get_boss_name() -> String:
	if _boss:
		return _boss.boss_name
	else:
		return "Boss"
