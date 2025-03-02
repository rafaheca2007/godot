extends Node2D

var vueltas_jugador := 0
var vueltas_ia := 0

func _on_Meta_body_entered(body):
	if body.is_in_group("player"):
		vueltas_jugador += 1
	elif body.is_in_group("ia"):
		vueltas_ia += 1

	if vueltas_jugador >= 3:
		mostrar_ganador("JUGADOR GANADDOR")
	elif vueltas_ia >= 3:
		mostrar_ganador("IA GANADOR")
	
	
	
	
