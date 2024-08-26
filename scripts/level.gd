extends Node2D

signal player_died

@onready var start = $Start
var player = null

func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		player.global_position = start.global_position
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
	player.position = start.global_position
	player_died.emit()
