extends Area2D

@export var speed = 700
var direction = Vector2(0, -speed)

func _physics_process(delta):
	position += direction * delta

	if not get_viewport_rect().has_point(global_position):
		queue_free()
