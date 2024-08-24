extends ParallaxBackground

@onready var sprite = $ParallaxLayer/Sprite2D
@export var bg_texture: CompressedTexture2D = preload("res://assets/textures/bg/Purple.png")

var scroll_speed = -10

func _ready():
	sprite.texture = bg_texture			# Set the texture of the sprite

func _process(delta):
	# set the scrolling of the background
	sprite.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
	# Check if the background has reached the end of the texture
	if sprite.region_rect.position >= Vector2(64, 64) || sprite.region_rect.position <= Vector2(-64, -64):
		# Reset the position of the background
		sprite.region_rect.position = Vector2.ZERO

	# if sprite:
	#     var new_position = sprite.region_rect.position
	#     new_position.x += delta * scroll_speed
	#     sprite.region_rect.position = new_position
	# else:
	#     print("Sprite2D node not found")