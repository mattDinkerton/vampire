extends Node2D

class_name world

@onready var heartsContainer = $CanvasLayer/heartsContainer
@onready var player = $player
# Called when the node enters the scene tree for the first time.
func _ready():
	heartsContainer.setMaxHearts(player.hp)
	heartsContainer.updateHearts(player.hp)
	player.healthChanged.connect(heartsContainer.updateHearts)
	$Timer.start()


# Script that enables the pause menu

signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		
		get_tree().paused = !game_paused
		emit_signal("toggle_game_paused", game_paused)


func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused

func _on_timer_timeout():
	spawn()

func spawn():
	var enemy = load("res://scenes/enemy.tscn").instantiate()
	add_child(enemy)
	enemy.position = get_node("player").position + Vector2(1000,0).rotated(randf_range(0,2 * PI))
