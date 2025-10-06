class_name AntBite extends Area2D

@onready var bait_image: Sprite2D = $BaitImage

var is_poison: bool


func _ready() -> void:
	bait_image.frame = 2


func set_type(bite_type: String):
	if bite_type == "random":
		is_poison = randf() > 0.7
	else:
		is_poison = bite_type == "poison"
	
	if is_poison:
		bait_image.frame = 1
	else:
		bait_image.frame = 0
	Signals.emit_ant_bite_appears(global_position)


func die():
	Signals.emit_ant_bite_disappears()
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is BossMamaRoach:
		die()
	else:
		if body is Ant:
			if is_poison:
				body.die()
			else:
				Signals.emit_attack_boss(body)
			die()
