extends Node2D

@onready var parallax_background: ParallaxBackground = $ParallaxBackground
@onready var car: Sprite2D = $Car
@onready var start_button: TextureButton = $StartButton

@export var road_speed: float = 500.0
@export var car_speed: float = 100.0
@export var car_acseleration: float = 1.05


var run_car: bool = false
var start_button_pos: Vector2


func _ready() -> void:
	Signals.connect_start_game(on_start_game)
	start_button_pos = start_button.global_position


func _process(delta: float) -> void:
	parallax_background.scroll_offset.x -= road_speed * delta
	if run_car:
		car.global_position.x += car_speed * delta
		car_speed *= car_acseleration
	
	if car.global_position.x > 2000:
		Scenes.go_to_next_scene()


func on_start_game():
	run_car = true
	GameState.current_boss_index = 0
	GameState.current_day = 0


func _on_texture_button_mouse_entered() -> void:
	start_button.global_position += Vector2(-10, -10)


func _on_start_button_mouse_exited() -> void:
	start_button.global_position = start_button_pos


func _on_start_button_pressed() -> void:
	start_button.hide()
	Signals.emit_start_game()
