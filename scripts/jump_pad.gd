extends Area2D

@export var jump_height = 300
@onready var jump_animation = $JumpAnimation

func _on_body_entered(body:Node2D):
	if body is Player:
		print("Bounce!")
		jump_animation.play("jump")

