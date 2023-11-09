extends CharacterBody2D


@export var movement_speed = 20.0 
@export var hp = 10

@onready var player = get_tree().get_first_node_in_group("player") #get me the first node you can find in player tab(scene)
@onready var spirte = $AnimatedSprite2D

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	
	velocity = direction * movement_speed
	
	move_and_slide()


func _on_hurt_box_hurt(damage):
	hp -= damage
	print("lol")
	if hp <= 0:
		queue_free()

