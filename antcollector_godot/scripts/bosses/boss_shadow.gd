extends Node2D

var radius: float = 0.0       # current radius
var target_radius: float = 100.0
var duration: float = 1.0     # seconds
var elapsed: float = 0.0
var animating: bool = false

# Start the circle animation
func start_circle(pos: Vector2, max_radius: float, time: float):
	position = pos
	target_radius = max_radius
	duration = time
	elapsed = 0.0
	radius = 0.0
	animating = true
	queue_redraw()

func _process(delta):
	if animating:
		elapsed += delta
		var t = clamp(elapsed / duration, 0.0, 1.0)
		# Linear interpolation 0 → target_radius
		radius = lerp(0.0, target_radius, t)
		queue_redraw()

		if t >= 1.0:
			animating = false

func _draw():
	if radius > 0.0:
		# Draw semi-transparent black circle
		draw_circle(Vector2.ZERO, radius, Color(0, 0, 0, 0.3))
