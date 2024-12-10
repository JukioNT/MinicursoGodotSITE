extends CharacterBody2D

@export var speed = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var input = Input.get_axis("move_left","move_right")
	velocity.x = input * speed * delta
	
	move_and_slide()
