extends Node2D

extends CharacterBody2D

@onready var nav_agent = $NavigationAgent2D
@export var velocidad := 250.0

func _process(delta):
	var objetivo = nav_agent.get_next_path_position()
	var direccion = (objetivo - global_position).normalized()
	velocity = direccion * velocidad
	move_and_slide()

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		position += Vector2(20, 0)
