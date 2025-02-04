extends Control
@onready var audio_stream_player: AudioStreamPlayer = $Button/AudioStreamPlayer





func _on_regresar_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")
	audio_stream_player.play()
