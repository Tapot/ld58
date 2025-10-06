extends Node2D

const TIME_TO_NEXT: float = 10.0

@onready var battle_boss_1: Sprite2D = $BattleBoss1
@onready var battle_boss_2: Sprite2D = $BattleBoss2
@onready var battle_boss_3: Sprite2D = $BattleBoss3
@onready var simple_button: SimpleButton = $SimpleButton

var timer: float = 0.0
var _splashes
var _placed : bool = false


func _ready() -> void:
	Scenes.current_scene = "battle_splash"
	simple_button.set_text("GO!")
	timer = 0.0
	_splashes = [
		battle_boss_1,
		battle_boss_2,
		battle_boss_3,
	]


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		Scenes.go_to_next_scene()


func _process(delta: float) -> void:
	if not _placed:
		_placed = false
		place_splash(GameState.current_boss_index)
	
	timer += delta
	if timer > TIME_TO_NEXT:
		timer = 0.0
		Scenes.go_to_next_scene()


func place_splash(index: int) -> void:
	var splash = _splashes[index]
	# Start above the screen
	splash.position.y = -2000  

	# Create tween for falling
	var tween = create_tween()

	# Fast fall down to y=400 in 0.3s with bounce effect
	tween.tween_property(
		splash,
		"position:y", 0, 0.5
	).set_trans(
		Tween.TRANS_BACK
	).set_ease(Tween.EASE_OUT)


func _on_simple_button_pressed() -> void:
	Scenes.go_to_next_scene()
