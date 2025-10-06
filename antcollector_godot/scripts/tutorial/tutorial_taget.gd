class_name Jar extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is Ant:
		body.die("jar")
