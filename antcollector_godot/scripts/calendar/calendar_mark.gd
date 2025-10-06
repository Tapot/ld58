extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D


func set_success():
	sprite_2d.frame = 3


func set_fail():
	sprite_2d.frame = 1
