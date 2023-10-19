extends Node2D

@onready var heartsContainer = $CanvasLayer/heartsContainer
@onready var player = $player

# Called when the node enters the scene tree for the first time.
func _ready():
	heartsContainer.setMaxHearts(player.hp)
	heartsContainer.updateHearts(player.hp)
	player.healthChanged.connect(heartsContainer.updateHearts)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
