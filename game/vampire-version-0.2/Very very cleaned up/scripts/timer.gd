extends Control

var seconds = 0
var minutes = 0
var Dseconds = 0
var Dminutes = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Reset_Timer()


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_timer_timeout():
	seconds += 1
	if seconds == 60:
		reset_seconds()
		minutes += 1
	
	$Label.text=str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)
	
	
func Reset_Timer():
	seconds = Dseconds
	minutes = Dminutes

func reset_seconds():
	seconds = Dseconds
