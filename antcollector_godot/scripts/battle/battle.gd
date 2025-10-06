class_name Battle extends Node2D


@onready var ants: Node2D = $Ants
@onready var boss_hp: ProgressBar = $BossHP
@onready var ants_spawner: AntsSpawner = $AntsSpawner
@onready var ant_bite_spawner: AntsBiteSpawner = $AntBiteSpawner
@onready var bosses_spawner: BossesSpawner = $BossesSpawner
@onready var simple_button: SimpleButton = $BattleEnd/SimpleButton
@onready var battle_end: Sprite2D = $BattleEnd
@onready var battle_end_label: Label = $BattleEnd/BattleEndLabel
@onready var boss_name: Label = $BossHP/BossName


var wave_number: int = 0
var waves: Array[int] = [
	1, 2, 2, 3, 3, 5, 5
]
var spawn_timer: float = 0.0
var spawn_threshold: float = 10
var is_no_more_ants: bool = false
var boss_is_dead: bool = false
var is_battle_over: bool = false


func _ready():
	if GameState.current_boss_index == 2:
		Sfx.play_music_mama()
	else:
		Sfx.play_music_battle()
	Signals.emit_next_day()
	battle_end.hide()
	simple_button.set_text("ok")
	Scenes.current_scene = "battle"
	GameState.is_tutor_passed = true
	Signals.connect_attack_boss(
		on_attack_boss
	)
	Signals.connect_damage_boss(
		on_damage_boss
	)
	setup_hp_bar()
	bosses_spawner.spawn_boss(GameState.current_boss_index)
	boss_name.text = bosses_spawner.get_boss_name()
	spawn_wave()


func _process(delta: float) -> void:
	spawn_timer += delta
	if ants_spawner.is_all_died() or spawn_timer > spawn_threshold:
		spawn_wave()
	
	if not is_battle_over:
		if is_no_more_ants and ants_spawner.is_all_died():
			fight_over(false)
		
		if boss_is_dead:
			fight_over(true)


func on_attack_boss(ant: Ant) -> void:
	ant.attack_boss(
		bosses_spawner.get_boss_position()
	)


func on_damage_boss(damage: float) -> void:
	boss_hp.value -= damage
	if boss_hp.value < 1:
		bosses_spawner.kill_the_boss()
		GameState.current_boss_index += 1
		fight_over(true)


func setup_hp_bar() -> void:
	var boss_hp_max = GameState.bosses_hp[
		GameState.current_boss_index
	]
	boss_hp.max_value = boss_hp_max
	boss_hp.value = boss_hp_max


func fight_over(success: bool):
	if not is_battle_over:
		is_battle_over = true
		GameState.add_fight_results(success)
		battle_end.show()
		
		if success:
			battle_end_label.text = "BOSS is dead"
		else:
			battle_end_label.text = "ALL Ants are dead"


func spawn_wave() -> void:
	if is_battle_over:
		return
	if wave_number >= waves.size():
		is_no_more_ants = true
		return
	spawn_timer = 0.0
	var ants_count = waves[wave_number]
	wave_number += 1
	for i in range(ants_count):
		ants_spawner.spawn_ant()


func _on_color_rect_gui_input(event: InputEvent) -> void:
	if not boss_is_dead:
		if event is InputEventMouseButton and event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT:
				ant_bite_spawner.spawn_ant_bite(
					event.global_position, "random"
				)
				Sfx.play_bite()


func _on_simple_button_pressed() -> void:
	Scenes.go_to_next_scene()
