extends CharacterBody2D

@onready var shadow: Sprite2D = $Shadow
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer


var jump_time_sec: float = 3.0
var base_pos : Vector2


func _ready() -> void:
	global_position = Screen.get_center_point_on_screen()
	base_pos = global_position
	jump()


func jump() -> void:
	sprite_2d.hide()
	global_position = Screen.get_random_point_on_screen()
	shadow.show()
	await get_tree().create_timer(jump_time_sec).timeout
	shadow.hide()
	sprite_2d.show()
	timer.start()


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Ant:
		if body.is_attacking:
			Signals.emit_damage_boss(
				body.attack_size
			)
		body.die()


func _on_timer_timeout() -> void:
	jump()
