extends Control
@onready var audio_stream_player: AudioStreamPlayer = $VBoxContainer/SALIR/AudioStreamPlayer


func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/juego.tscn")


func _on_instrucciones_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/instrucciones.tscn")


func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/creditos.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_salir_mouse_entered() -> void:
	audio_stream_player.play()
