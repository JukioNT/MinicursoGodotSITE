extends Area2D

@export var speed = 400
var direction = Vector2(0, speed)

func _physics_process(delta):
	position += direction * delta

	if not get_viewport_rect().has_point(global_position):
		queue_free()

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")
