class_name BossAntie extends CharacterBody2D


var _init_place_y_movement: float = 300
var _init_speed: float = 50

func _ready() -> void:
	global_position = Screen.get_bottom_centred_point_on_screen()
	

func _process(delta: float) -> void:
	if _init_place_y_movement > 0:
		_init_place_y_movement -= delta * _init_speed
		global_position.y -= delta * _init_speed


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Ant:
		if body.is_attacking:
			Signals.emit_damage_boss(
				body.attack_size
			)
		body.die()
