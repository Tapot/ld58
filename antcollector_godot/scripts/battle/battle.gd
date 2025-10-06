class_name Battle extends Node2D


@onready var ants: Node2D = $Ants
@onready var boss_hp: ProgressBar = $BossHP
@onready var ants_spawner: AntsSpawner = $AntsSpawner
@onready var ant_bite_spawner: AntsBiteSpawner = $AntBiteSpawner
@onready var bosses_spawner: BossesSpawner = $BossesSpawner


var wave_number: int = 0
var waves: Array[int] = [
	1, 2, 2, 3, 3, 5, 5
]
var spawn_timer: float = 0.0
var spawn_threshold: float = 10
var is_no_more_ants: bool = false
var boss_is_dead: bool = false


func _ready():
	Scenes.current_scene = "battle"
	GameState.is_tutor_passed = true
	Signals.connect_attack_boss(
		on_attack_boss
	)
	Signals.connect_damage_boss(
		on_damage_boss
	)
	bosses_spawner.spawn_boss(GameState.current_boss_index)
	spawn_wave()


func _process(delta: float) -> void:
	spawn_timer += delta
	if ants_spawner.is_all_died() or spawn_timer > spawn_threshold:
		spawn_wave()
	
	if is_no_more_ants and ants_spawner.is_all_died():
		Scenes.go_to_next_scene()
	
	if boss_is_dead:
		Scenes.go_to_next_scene()


func on_attack_boss(ant: Ant) -> void:
	ant.attack_boss(
		bosses_spawner.get_boss_position()
	)


func on_damage_boss(damage: float) -> void:
	boss_hp.value -= damage
	if boss_hp.value < 1:
		boss_is_dead = true
		GameState.current_boss_index += 1


func spawn_wave() -> void:
	if wave_number >= waves.size():
		is_no_more_ants = true
		return
	spawn_timer = 0.0
	var ants_count = waves[wave_number]
	wave_number += 1
	for i in range(ants_count):
		ants_spawner.spawn_ant()


func _on_spawn_ant_button_pressed() -> void:
	ants_spawner.spawn_ant()


func _on_boss_attack_button_pressed() -> void:
	pass # Replace with function body.


func _on_next_day_button_pressed() -> void:
	Scenes.go_to_next_scene()


func _on_color_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			ant_bite_spawner.spawn_ant_bite(
				event.global_position, "random"
			)
