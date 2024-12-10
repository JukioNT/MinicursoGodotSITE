extends Area2D

var enemy_spawner

func _ready():
	$AnimatedSprite2D.play("idle")
	enemy_spawner = get_parent()

func _process(delta):
	pass

func _on_area_entered(area):
	area.queue_free()
	queue_free()

func _on_body_entered(body):
	enemy_spawner._on_enemy_signal()
