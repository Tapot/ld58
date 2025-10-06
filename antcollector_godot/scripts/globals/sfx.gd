extends Node2D

@onready var sfx: AudioStreamPlayer2D = $sfx
const SWITCH_002 = preload("res://assets/sfx/switch_002.ogg")
const TICK_002 = preload("res://assets/sfx/tick_002.ogg")
const FALL_5 = preload("res://assets/sfx/fall5.ogg")
const EXPLOSION_4 = preload("res://assets/sfx/explosion4.ogg")

var SFX = {
	"click": SWITCH_002,
	"bite": TICK_002,
	"explode": EXPLOSION_4,
	"die": FALL_5,
}



func play_sfx(sfx_name: String) -> void:
	if not sfx.playing:
		sfx.stream = SFX[sfx_name]
		sfx.play()


func play_click() -> void:
	play_sfx("click")


func play_bite() -> void:
	play_sfx("bite")


func play_die() -> void:
	play_sfx("die")
	

func play_explode() -> void:
	play_sfx("explode")
