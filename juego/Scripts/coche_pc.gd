extends CharacterBody2D

@onready var nav_agent = $"../NavigationAgent2D"
@export var velocidad := 20.0

func _process(delta):
	var objetivo = nav_agent.get_next_path_position()
	var direccion = (objetivo - global_position).normalized()
	velocity = direccion * velocidad
	move_and_slide()
