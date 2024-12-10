extends StaticBody2D

func _ready():
	for wall in get_children():
		if wall.name == "Wall_R":
			wall.position.x = get_viewport().size.x + 10
		else:
			wall.position.x = 0 - 10
