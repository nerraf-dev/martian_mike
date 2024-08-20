extends Area2D


@onready var jump_animation = $JumpAnimation

@export var jump_force = 300

func _on_body_entered(body:Node2D):
	if body is Player:
		print("Bounce!")
		jump_animation.play("jump")
		body.jump(jump_force)

