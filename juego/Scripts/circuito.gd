extends Node2D

extends CharacterBody2D

@export var aceleracion := 300.0
@export var freno := 500.0
@export var max_velocidad := 400.0
@export var rotacion_velocidad := 3.0
@export var friccion := 200.0

var velocidad := Vector2.ZERO
var puede_acelerar := true

func _physics_process(delta):
	var direccion = 0

	# Girar izquierda y derecha
	if Input.is_action_pressed("ui_left"): 
		rotate(-rotacion_velocidad * delta)
	if Input.is_action_pressed("ui_right"): 
		rotate(rotacion_velocidad * delta)

	if Input.is_action_pressed("ui_up") and puede_acelerar: 
		velocidad += Vector2.UP.rotated(rotation) * aceleracion * delta

	if Input.is_action_pressed("ui_down"): 
		velocidad -= Vector2.UP.rotated(rotation) * freno * delta

	if Input.is_action_pressed("marcha_atras"): 
		velocidad = Vector2.UP.rotated(rotation) * -200

	velocidad = velocidad.move_toward(Vector2.ZERO, friccion * delta)

	move_and_slide()

func frenar():
	puede_acelerar = false
	velocidad *= 0.5
	await get_tree().create_timer(1.5).timeout
	puede_acelerar = true
