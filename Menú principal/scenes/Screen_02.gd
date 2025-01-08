extends Node2D

var change_scene = preload(res://scenes/scene_01.tscn)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(change_scene)
	pass # Replace with function body.
