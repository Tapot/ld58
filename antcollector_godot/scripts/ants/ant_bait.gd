class_name AntBite extends Area2D

@onready var bait_image: Sprite2D = $BaitImage

var is_poison: bool


func _ready() -> void:
	bait_image.frame = 2


func set_type(bite_type: String) -> void:
	if bite_type == "random":
		is_poison = randf() > 0.5
	else:
		is_poison = bite_type == "poison"
	
	if is_poison:
		bait_image.frame = 1
	else:
		bait_image.frame = 0
	Signals.emit_ant_bite_appears(global_position)


func die() -> void:
	Signals.emit_ant_bite_disappears()
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	Sfx.play_eat()
	if body is BossMamaRoach:
		die()
	
	elif body is BossFly:
		if not is_poison:
			die()
	elif body is Ant:
		
		if is_poison:
			body.die("poison")
		else:
			Signals.emit_attack_boss(body)
		die()
