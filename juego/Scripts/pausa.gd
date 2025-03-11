extends Button

@onready var pause_menu = $"."  # Referencia a un menú de pausa opcional

func _ready():
	self.pressed.connect(_on_pause_pressed)

func _on_pause_pressed():
	get_tree().paused = !get_tree().paused  # Alternar pausa
	if get_tree().paused:
		text = "Reanudar"
		pause_menu.visible = true  # Muestra el menú si tienes uno
	else:
		text = "Pausar"
		pause_menu.visible = false  # Oculta el menú
