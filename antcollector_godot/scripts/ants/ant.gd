class_name Ant extends CharacterBody2D


var max_hp: int = 10
var current_hp: = max_hp
var move_speed: float = 100.0
var attack_speed: float = 1.0
var attack_size: int = 1


var enemy_target
var move_target
var threshold: float = 4.0
var turn_speed: float = 5.0

func _ready() -> void:
	move_target = Screen.get_random_point_on_screen()

func _physics_process(delta: float) -> void:
	if move_target:
		move_to_target(delta, move_speed)
	else:
		move_target = Screen.get_random_point_on_screen()
	move_and_slide()

func move_to_target(delta: float, speed: float) -> bool:
	var to_target = move_target - global_position
	
	# check if the target is reached
	if to_target.length() <= threshold:
		global_position = move_target
		move_target = null
		return true
	
	# calculate the desired angle towards the target
	var desired_angle = to_target.angle()
	
	# smoothly rotate towards the desired angle
	rotation = lerp_angle(rotation, desired_angle, turn_speed * delta)
	
	# move forward in the direction of the current rotation
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += direction * speed * delta
	
	return false

func attack():
	if enemy_target:
		enemy_target.make_damage(attack)
