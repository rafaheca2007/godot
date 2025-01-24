extends Control



func _on_jugar_pressed() -> void:
	get_tree(). change_scene_to_file("res://scenes/jugar.tscn")

func _on_instrucciones_pressed() -> void:
	get_tree(). change_scene_to_file("res://scenes/instrucciones.tscn")

func _on_creditos_pressed() -> void:
	get_tree(). change_scene_to_file("res://scenes/creditos.tscn")
