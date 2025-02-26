extends RigidBody2D

var ruedas = []
var speed = 6000
var max_speed = 50

func _ready():
	ruedas = get_tree().get_nodes_in_group("rueda")

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		for ruedas in ruedas:
			if ruedas.angular_velocity < max_speed:
			ruedas.apply_torque_impulse(speed * delta * 60)
