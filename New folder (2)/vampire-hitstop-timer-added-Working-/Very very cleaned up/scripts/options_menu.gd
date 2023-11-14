extends Control

func _on_volume_pressed():
	pass # Replace with function body.


func _on_back_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
