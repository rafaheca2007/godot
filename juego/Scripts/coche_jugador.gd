extends CharacterBody2D

@export var aceleracion := 10.0
@export var freno := 5.0
@export var max_velocidad := 20.0
@export var rotacion_velocidad := 0.1
@export var friccion := 3.0
@onready var sonido_colision = $"../sonido colision"
@onready var sonido_frenado = $"../sonido frenado"

var velocidad := Vector2.ZERO
var puede_acelerar := true

func _physics_process(delta):
	var direccion = 0

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

func _on_AreaColision_body_entered(body):
	if body.is_in_group("ia"):
		frenar()
		sonido_colision.play()

func _on_AreaFrenado_body_entered(body):
	frenar()
	sonido_frenado.play()
