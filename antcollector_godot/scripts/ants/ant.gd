class_name Ant extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const MOVE_SPEED_DEFAULT: int = 100
const MOVE_BITED_ACS: int = 3
const MOVE_ATTACK_ACS: int = 6

var max_hp: int = 10
var current_hp: = max_hp
var move_speed: float = MOVE_SPEED_DEFAULT
var attack_speed_min: float = 1.0
var attack_speed_max: float = 1.0
var attack_time: float = 0.2
var attack_size: float = 10

var _move_target: Vector2 = Vector2.ZERO
var threshold: float = 20.0
var turn_speed: float = 5.0
var is_attacking: bool = false
var is_dead: bool = false


func _ready() -> void:
	set_random_move_target()
	Signals.connect_ant_bite_appears(
		on_ant_bite_appears
	)
	Signals.connect_ant_bite_disappears(
		on_ant_bite_disappears
	)
	sprite_2d.play("appear")

func _process(_delta: float) -> void:
	if global_position.x < -2000:
		die()
	if global_position.x > 3000:
		die()
	if global_position.y < -2000:
		die()
	if global_position.y > 3000:
		die()

func _physics_process(delta: float) -> void:
	if not is_dead:
		move_to_target(delta, move_speed)
		move_and_slide()


func set_random_move_target() -> void:
	is_attacking = false
	move_speed = MOVE_SPEED_DEFAULT
	set_move_target(
		Screen.get_random_point_on_screen()
	)

func set_move_target(pos: Vector2):
	_move_target = pos


func on_ant_bite_appears(pos: Vector2) -> void:
	if is_attacking:
		return
	
	move_speed = MOVE_BITED_ACS * MOVE_SPEED_DEFAULT
	set_move_target(pos)


func on_ant_bite_disappears() -> void:
	if is_attacking:
		return
	move_speed = MOVE_SPEED_DEFAULT
	set_random_move_target()
	

func move_to_target(delta: float, speed: float) -> void:
	if not _move_target:
		set_random_move_target()
	var to_target = _move_target - global_position
	
	if to_target.length() <= threshold:
		_move_target = Vector2.ZERO
		if not is_dead:
			sprite_2d.play("run")

	var desired_angle = to_target.angle()

	rotation = lerp_angle(rotation, desired_angle, turn_speed * delta)
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += direction * speed * delta


func die():
	collision_shape_2d.set_deferred("disabled", true)
	is_dead = true
	
	if is_attacking:
		sprite_2d.play("explode")
	else:
		sprite_2d.play("die")
	Signals.emit_ant_died(global_position)


func attack_boss(target_position: Vector2) -> void:
	is_attacking = true
	sprite_2d.play("attack")
	move_speed = MOVE_ATTACK_ACS * MOVE_SPEED_DEFAULT
	set_move_target(target_position)


func _on_sprite_2d_animation_finished() -> void:
	if is_dead:
		queue_free()
	else:
		sprite_2d.play("run")
