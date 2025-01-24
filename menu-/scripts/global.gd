extends Node2D

@onready var musica: AudioStreamPlayer = $AudioStreamPlayer

var musica_de_gameplay = preload("res://musica/DELLAFUENTE - 13 Preguntas (Visualizer)  TORII YAMA.mp3")

func _ready() -> void:
	musica. stream = musica_de_gameplay
	musica. play()

func _input(event: InputEvent) -> void:
	if event. is_action_pressed("pausar")
		if !musica.stream_paused:
			musica. stream_paused = true
		else:
			musica. stream_paused = false
