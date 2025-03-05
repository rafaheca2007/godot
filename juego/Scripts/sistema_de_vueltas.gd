extends Node2D

var vueltas_jugador := 0
var vueltas_ia := 0
@onready var sonido_colision = $SonidoColision
@onready var sonido_frenado = $SonidoFrenado

func _on_Meta_body_entered(body):
	if body.is_in_group("player"):
		vueltas_jugador += 1
	elif body.is_in_group("ia"):
		vueltas_ia += 1

	if vueltas_jugador >= 3:
		mostrar_ganador("HUMANO")
	elif vueltas_ia >= 3:
		mostrar_ganador("PC")

func mostrar_ganador(texto):
	$UI/LabelGanador.text = "GANADOR: " + texto
	$UI/LabelGanador.visible = true
	await get_tree().create_timer(4.0).timeout
	$UI/LabelGanador.visible = false


func _on_AreaColision_body_entered(body):
	if body.is_in_group("ia"):
		frenar()
		sonido_colision.play()

func _on_AreaFrenado_body_entered(body):
	frenar()
	sonido_frenado.play()
