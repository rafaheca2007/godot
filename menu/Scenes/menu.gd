extends Control





func _on_jugar_pressed() -> void:
	get_tree(). change_scene_to_file("res://Scenes/jugar.tscn")

func _on_instrucciones_pressed() -> void:
	get_tree(). change_scene_to_file("res://Scripts/instrucciones.tscn")
func _on_creditos_pressed() -> void:
	pass # Replace with function body.
