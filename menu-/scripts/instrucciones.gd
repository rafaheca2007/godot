extends Control


func _on_salir_de_las_instrucciones_pressed() -> void:
	get_tree(). change_scene_to_file("res://scenes/menu.tscn")
