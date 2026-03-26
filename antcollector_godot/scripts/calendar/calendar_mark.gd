class_name CalendarMark
extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D


func set_success() -> void:
	sprite_2d.frame = 3


func set_fail() -> void:
	sprite_2d.frame = 1
