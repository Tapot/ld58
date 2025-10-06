extends Node


var screen_size

func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size


func get_random_point_on_screen() -> Vector2:
	return Vector2(
		randf_range(0, screen_size.x),
		randf_range(0, screen_size.y),
	)


func get_bottom_centred_point_on_screen() -> Vector2:
	return Vector2(screen_size.x / 2, screen_size.y)


func get_center_point_on_screen() -> Vector2:
	return Vector2(screen_size.x / 2, screen_size.y / 2)
