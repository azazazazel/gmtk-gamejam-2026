extends CharacterBody2D

@export var rotation_speed = 4.0
@export var max_speed = 2000.0
@export var acceleration = 2.5
@export var brakefactor = 6.0
@export var startacceleration = 3
@export var friction = 5
var current_speed = 0.0
var rotation_direction = 0

func get_input():
	if Input.is_action_pressed("up"):
		if current_speed < 0:
			current_speed += (brakefactor * acceleration)
		elif current_speed < 500:
			current_speed += (startacceleration * acceleration)
		else:
			current_speed += acceleration
			
	elif Input.is_action_pressed("down"):
		if current_speed > 0:
			current_speed -= (brakefactor * acceleration)
		elif current_speed > 500:
			current_speed -= (startacceleration * acceleration)
		else:
			current_speed -= acceleration
			
	else:
		if current_speed > friction:
			current_speed -= friction
		elif current_speed < -friction:
			current_speed += friction
		else:
			current_speed = 0
		
	current_speed = clamp(current_speed, -max_speed, max_speed)
		
	rotation_direction = Input.get_axis("left", "right")
	velocity = -transform.y * current_speed

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
