extends CharacterBody2D

@export var aceleracion = 50
@export var frenar = 30
@export var girar_izquierda = 20
@export var rotacion_velocidad = 20

@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D

var velocidad := Vector2.ZERO
var puede_acelerar := true

func _physics_process(delta):
	var dirrecion = 0
	if Input.is_action_just_pressed("acelerar"):
		if not audio_stream_player.playing:
			audio_stream_player.play()
		audio_stream_player.stream_paused = false
	else:
		audio_stream_player.stream_paused = true




	if Input.is_action_pressed("mover_izquierda"): 
		rotate(-rotacion_velocidad * delta)
	if Input.is_action_pressed("mover_derecha"): 
		rotate(rotacion_velocidad * delta)

	
	if Input.is_action_pressed("acelerar"): 
		velocidad += Vector2.UP.rotated(rotation) * aceleracion * delta

	if Input.is_action_pressed("frenar"): 
		velocidad -= Vector2.UP.rotated(rotation) * frenar * delta

	if Input.is_action_pressed("marcha_atras"): 
		velocidad = Vector2.UP.rotated(rotation) * -200


	move_and_slide()

func freno():
	puede_acelerar = false
	velocidad *= 0.5
	await get_tree().create_timer(1.5).timeout
	puede_acelerar = true



func _ready() -> void:
	var button = Button.new()
