extends Node2D

@export var enemies: Array[EnemyData]
@export var start_x = 50
@export var row_gap = 45
@export var quant_enemies_columns = 10
@export var start_speed = 7
@export var speed_rise_per_enemy = 0.1
@export var enemy_drop_distance = 25
@export var drop_times_to_lose = 5
@export var enemy_count_hud: Label

var drop_times = 0
var signal_locked = false
var direction = 1
var enemy_size = 36
var start_enemy

func _ready():
	spawn_enemies()
	start_enemy = get_child_count()

func _process(delta):
	if (get_child_count() - 1) == 0 or drop_times == drop_times_to_lose:
		call_deferred("game_over")
	move_enemies(delta)
	enemy_count_hud.text = "Enemies: " + str(get_child_count()-1)

func spawn_enemies():
	var screen_width = get_viewport().size.x
	var end_x = screen_width - start_x
	var gap_enemy = (float(end_x - start_x) / float(quant_enemies_columns - 1))
	
	var location = Vector2(start_x, 50)
	
	for enemy in enemies:
		for i in enemy.count:
			for y in range(quant_enemies_columns):
				var enemy_instance = enemy.scene.instantiate()
				enemy_instance.global_position = location
				add_child(enemy_instance)
				location.x += gap_enemy
			location.x = start_x
			location.y += row_gap

func move_enemies(delta):
	var speed = start_speed + ((start_enemy - get_child_count()) * speed_rise_per_enemy)
	var screen_width = get_viewport().size.x
	global_position.x += direction * speed * delta
		
func move_enemies_down():
	direction *= -1
	global_position.y += enemy_drop_distance
	drop_times += 1

func _on_enemy_signal():
	if signal_locked:
		return
	else:
		move_enemies_down()
		signal_locked = true
		
		$Timer.start()
		
func game_over():
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn")


func _on_timer_timeout():
	signal_locked = false
