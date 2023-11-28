extends Sprite2D
@onready var ray_cast_2d = $RayCast2D



# Translation amount when flipping to the right
@export var translation_amount = 10 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mouse_pos = get_viewport().get_mouse_position()
	global_rotation = global_position.direction_to(get_global_mouse_position()).angle() + PI #rotates sprite based on mouse position
	
	# Get the screen width
	var screen_width = get_viewport_rect().size.x

	# Flip sprite based on mouse pos relative to the screen width
	if mouse_pos.x < screen_width / 2: #left of screen
		flip_h = false
		flip_v = false
		$".".position = Vector2(0, 15) #some slight ajustmnets
	elif mouse_pos.x > screen_width / 2: #right of screen
		flip_h = false
		flip_v = true
		$".".position = Vector2(0, -17)
