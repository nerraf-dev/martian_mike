extends Node2D

signal player_died

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		print("Quitting game")
		get_tree().quit()
	elif Input.is_action_just_pressed("restart"):
		print("Restarting game")
		get_tree().reload_current_scene()


func _on_deathzone_body_entered(body:Node2D):
	print(body.name, " entered the deathzone!")
	if body.name == "Player":
		body.velocity = Vector2.ZERO
		body.position = $StartPosition.global_position
		# body.emit_signal("player_died")
