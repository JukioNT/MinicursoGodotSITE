extends Node2D

@export var shoot: PackedScene
@export var start_shoot_chance = 5
@export var shoot_chanche_increase_per_enemy = 0.02

func _process(delta):
	var start_enemies_qtd = get_parent().get_parent().start_enemy - 1
	var enemy_count = get_parent().get_parent().get_child_count() - 1
	var shoot_chance = start_shoot_chance + (start_enemies_qtd - enemy_count)
	
	var rand_num = randi() % 10001
	
	if(rand_num <= shoot_chance):
		var shoot_instance = shoot.instantiate()
		shoot_instance.global_position = global_position
		get_tree().root.get_node("Node2D").add_child(shoot_instance)
