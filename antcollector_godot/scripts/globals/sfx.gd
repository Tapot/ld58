extends Node2D

@onready var sfx: AudioStreamPlayer2D = $sfx
@onready var music: AudioStreamPlayer2D = $music


const LD_58_ANTSBATTLER_MENU = preload("res://assets/sfx/ld58-antsbattler-menu.mp3")
const LD_58_ANTSBATTLER_METAL_BATTLE = preload("res://assets/sfx/ld58-antsbattler-metal-battle.mp3")
const LD_58_ANTSBATTLER_MECHA_COMBAT = preload("res://assets/sfx/ld58-antsbattler-mecha-combat.mp3")

const SWITCH_002 = preload("res://assets/sfx/switch_002.ogg")
const TICK_002 = preload("res://assets/sfx/tick_002.ogg")
const FALL_5 = preload("res://assets/sfx/fall5.ogg")
const EXPLOSION_4 = preload("res://assets/sfx/explosion4.ogg")
const LD_58_ANTSBATTLER_FX_EAT = preload("res://assets/sfx/ld58-antsbattler-fx-eat.mp3")
const LD_58_ANTSBATTLER_FX_ROACH_2 = preload("res://assets/sfx/ld58-antsbattler-fx-roach2.mp3")
const LD_58_ANTSBATTLER_FX_CAR_BYPASS = preload("res://assets/sfx/ld58-antsbattler-fx-car-bypass.mp3")
const LD_58_ANTSBATTLER_FX_CLICK = preload("res://assets/sfx/ld58-antsbattler-fx-click.mp3")

var MUSIC = {
	"menu": LD_58_ANTSBATTLER_MENU,
	"battle": LD_58_ANTSBATTLER_MECHA_COMBAT,
	"mama": LD_58_ANTSBATTLER_METAL_BATTLE,
}

var SFX = {
	"click": LD_58_ANTSBATTLER_FX_CLICK,
	"bite": TICK_002,
	"explode": EXPLOSION_4,
	"die": FALL_5,
	"eat": LD_58_ANTSBATTLER_FX_EAT,
	"turn": LD_58_ANTSBATTLER_FX_ROACH_2,
	"car": LD_58_ANTSBATTLER_FX_CAR_BYPASS,
}


func play_music_menu():
	if music.playing:
		music.stop()
	music.stream = MUSIC["menu"]
	music.play()


func play_music_battle():
	if music.playing:
		music.stop()
	music.stream = MUSIC["battle"]
	music.play()


func play_music_mama():
	if music.playing:
		music.stop()
	music.stream = MUSIC["mama"]
	music.play()


func play_sfx(sfx_name: String) -> void:
	if not sfx.playing:
		sfx.stop()
	sfx.stream = SFX[sfx_name]
	sfx.play()


func play_click() -> void:
	play_sfx("click")


func play_bite() -> void:
	play_sfx("bite")


func play_die() -> void:
	play_sfx("die")


func play_eat() -> void:
	play_sfx("eat")


func play_explode() -> void:
	play_sfx("explode")

func play_turn() -> void:
	play_sfx("turn")


func play_car() -> void:
	play_sfx("car")
