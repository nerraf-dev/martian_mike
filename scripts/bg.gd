extends ParallaxBackground

@onready var sprite = $ParallaxLayer/Sprite2D

var scroll_speed = -10

func _process(delta):
	sprite.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)

    # if sprite:
    #     var new_position = sprite.region_rect.position
    #     new_position.x += delta * scroll_speed
    #     sprite.region_rect.position = new_position
    # else:
    #     print("Sprite2D node not found")