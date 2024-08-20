extends CharacterBody2D

@onready var sprite = $Sprite

@export var gravity = 400.0
@export var speed = 125.0
@export var jump_velocity = -200.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500
	# Handle jump.
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	# print("Direction: ", direction)
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
	
	velocity.x = direction * speed
	move_and_slide()
	update_animation(direction)


func update_animation(direction):
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("run")
	else:
		if velocity.y < 0:
			sprite.play("jump")
		else:
			sprite.play("fall")
	
		
