extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("quit"):
		print("Quitting game")
		get_tree().quit()
	elif Input.is_action_just_pressed("restart"):
		print("Restarting game")
		get_tree().reload_current_scene()
