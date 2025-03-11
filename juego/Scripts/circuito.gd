extends Node2D

var vueltas_jugador := 0
var vueltas_ia := 0

func _on_Meta_body_entered(body):
	if body.is_in_group("player"):
		vueltas_jugador += 1
	elif body.is_in_group("ia"):
		vueltas_ia += 1

	# Verificar si alguien ganó
	if vueltas_jugador >= 3:
		mostrar_ganador("HUMANO")
	elif vueltas_ia >= 3:
		mostrar_ganador("PC")

func mostrar_ganador(texto):
	$ganador.text = "GANADOR: " + texto
	$ganador.visible = true
	await get_tree().create_timer(4.0).timeout
	$ganador.visible = false
