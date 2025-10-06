class_name BossAntie extends CharacterBody2D


func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Ant:
		if body.is_attacking:
			Signals.emit_damage_boss(
				body.attack_size
			)
		body.die()
