extends Node2D

@export var valor= 1

func _process(delta: float) -> void:
	rotation_degrees += 90 * delta

func _on_Moneda_body_entered(body: Node) -> void:
	if body.has.method("morirse") and body.name == "Jugador":
		body.recolectarMonedas()
		queue_free()
