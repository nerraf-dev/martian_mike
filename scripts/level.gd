extends Node2D

signal player_died

@onready var start_position = $StartPosition
@onready var player = $Player

func _ready():
	
	var traps = get_tree().get_nodes_in_group("traps")
	print("Found ", traps.size(), " traps")
	for trap in traps:
		print(trap.name)
		# trap.connect("touched_player", _on_trap_touched_player)
		trap.touched_player.connect(_on_trap_touched_player)


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
		reset_player()

func _on_trap_touched_player():
	print("Player touched the trap!")
	reset_player()


func reset_player():
	player.velocity = Vector2.ZERO
	player.position = start_position.global_position
	player_died.emit()
