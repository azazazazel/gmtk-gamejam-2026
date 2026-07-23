extends CharacterBody2D

@export var rotation_speed = 4.0
@export var max_speed = 2000.0
@export var acceleration = 2.5
@export var brakefactor = 6.0
var current_speed = 0.0
var rotation_direction = 0

func get_input():
	if Input.is_action_pressed("up"):
		if current_speed < 0:
			current_speed = min(current_speed + brakefactor * acceleration, max_speed)
		else:
			current_speed = min(current_speed + acceleration, max_speed)
	if Input.is_action_pressed("down"):
		if current_speed > 0:
			current_speed = max(current_speed - brakefactor * acceleration, -max_speed)
		else:
			current_speed = max(current_speed - acceleration, -max_speed)
			
	
	rotation_direction = Input.get_axis("left", "right")
	velocity = -transform.y * current_speed
	print(current_speed)
	

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
