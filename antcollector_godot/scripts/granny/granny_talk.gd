extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var _timer: float = 0.0
var _start_glitch_time: float = 1.0
func _process(delta: float) -> void:
	_timer += delta
	
	if _timer > _start_glitch_time:
		_timer = 0
		_start_glitch_time = randf_range(2, 5)
		animated_sprite_2d.play("glitch")
