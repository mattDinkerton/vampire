extends CollisionShape2D
@export var Bullet = PackedScene.new()
@onready var end_of_gun = $EndOfGun
@export var bullet_speed = 1000
var direction := Vector2.ZERO



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()
func shoot():
	var bullet_instance = Bullet.instantiate()
	add_child(bullet_instance)
	bullet_instance.global_position = end_of_gun.global_position
	var target = get_global_mouse_position()
	var direction_to_mouse = bullet_instance.global_position.direction_to(target).normalized()
	bullet_instance.set_direction(direction_to_mouse)
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())	
func ready():
	$"Muzzle"/EndOfGun.visible = false	
	
