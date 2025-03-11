extends CharacterBody2D

@onready var audio_stream_player: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

@export var aceleracion := 10.0
@export var freno := 5.0
@export var max_velocidad := 20.0
@export var rotacion_velocidad := 0.1
@export var friccion := 3.0


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




	if Input.is_action_pressed("ui_left"): 
		rotate(-rotacion_velocidad * delta)
	if Input.is_action_pressed("mover_right"): 
		rotate(rotacion_velocidad * delta)

	
	if Input.is_action_pressed("ui_up"): 
		velocidad += Vector2.UP.rotated(rotation) * aceleracion * delta

	if Input.is_action_pressed("ui_down"): 
		velocidad -= Vector2.UP.rotated(rotation) * freno * delta

	if Input.is_action_pressed("marcha_atras"): 
		velocidad = Vector2.UP.rotated(rotation) * -200


	move_and_slide()

func frenar():
	puede_acelerar = false
	velocidad *= 0.5
	await get_tree().create_timer(1.5).timeout
	puede_acelerar = true



func _ready() -> void:
	var button = Button.new()
