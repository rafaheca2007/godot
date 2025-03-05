extends Control

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			get_tree().paused = true
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			get_tree().paused = false

func _on_BotonReiniciar_pressed():
	get_tree().reload_current_scene()


func _on_BotonMenu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
