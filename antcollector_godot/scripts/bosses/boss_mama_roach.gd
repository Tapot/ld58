class_name BossMamaRoach extends CharacterBody2D

var move_speed: float = 600.0
var rotate_speed: float = 2.0
var rotate_tolerance: float = 0.5
var threshold: float = 10
var _move_target


func _ready() -> void:
	global_position = Screen.get_random_point_on_screen()
	Signals.connect_ant_bite_appears(
		on_ant_bite_appears
	)


func _physics_process(delta: float) -> void:
	if _move_target:
		if rotate_to_target(
			_move_target,
			delta,
			rotate_speed,
			rotate_tolerance,
		):
			move_to_target(delta, move_speed)
	else:
		_move_target = Screen.get_random_point_on_screen()
	move_and_slide()

func rotate_to_target(
	target: Vector2,
	delta: float,
	rotation_speed: float,
	tolerance: float
) -> bool:
	# direction from self to target
	var dir = (target - global_position).normalized()
	# desired angle
	var target_angle = dir.angle()
	# shortest signed angle between current and target
	var angle_diff = wrapf(target_angle - rotation, -PI, PI)

	# check if close enough
	if abs(angle_diff) <= tolerance:
		rotation = target_angle
		return true

	# rotate step depending on delta and rotation_speed
	var step = rotation_speed * delta
	# clamp rotation so we don't overshoot
	if abs(angle_diff) < step:
		rotation = target_angle
	else:
		rotation += step * sign(angle_diff)

	return false

func move_to_target(delta: float, speed: float) -> void:
	var to_target = _move_target - global_position
	
	if to_target.length() <= threshold:
		_move_target = Vector2.ZERO

	var desired_angle = to_target.angle()

	rotation = lerp_angle(rotation, desired_angle, rotate_speed * delta)
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += direction * speed * delta


func on_ant_bite_appears(pos: Vector2):
	_move_target = pos




func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Ant:
		if body.is_attacking:
			Signals.emit_damage_boss(
				body.attack_size
			)
		body.die("mama_roach")
