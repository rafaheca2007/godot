extends Node2D

@export var aceleracion = 300
@export var freno = 500
@export var rotacion_velocidad = 3
@export var friccion = 200

var velocidad = Vector2.ZERO
var puede_acelerar = true

func _physics_process(delta):
	var direccion = 0
	if Input.is_action_pressed("ui_left"):
		rotate(-rotacion_velocidad * delta)
	if Input.is_action_pressed("ui_right"):
		rotate(rotacion_velocidad * delta)
	if Input.is_action_pressed("ui_up"):
		velocidad += Vector2.UP.rotated(rotation) * aceleracion * delta
	if Input.is_action_pressed("ui_down"):
		velocidad += -Vector2.UP.rotated(rotation) * freno * delta
	if Input.is_action_pressed("marcha_atras"):
		velocidad += Vector2.UP.rotated(rotation) * -200
	
	velocidad = velocidad.move_toward(Vector2.ZERO, friccion * delta)

func frenar():
	puede_acelerar = false
	velocidad *= 0.5
	await get_tree().create_timer(1.5). timeout
