extends Node2D

@export var shoot: PackedScene

func _input(event):
	if Input.is_action_just_pressed("shoot"):
		var shoot_instance = shoot.instantiate()
		shoot_instance.global_position = global_position
		get_tree().root.get_node("Node2D").add_child(shoot_instance)
