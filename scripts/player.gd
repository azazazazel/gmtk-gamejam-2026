extends CharacterBody2D

@export var rotation_speed = 1.5
@export var max_speed = 1000.0
@export var acceleration = 2.5
var current_speed = 0
var rotation_direction = 0

func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.y * Input.get_axis("up", "down") * current_speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	current_speed = min(current_speed + acceleration, max_speed)
	#$Label.text = str(current_speed)
	move_and_slide()
