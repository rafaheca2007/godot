extends Control
@onready var audio_stream_player: AudioStreamPlayer = $VOLVER/AudioStreamPlayer



func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu.tscn")


func _on_volver_mouse_entered() -> void:
	audio_stream_player.play()
