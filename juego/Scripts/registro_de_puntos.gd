extends Node

var best_score = 0  
var score = 0  

const SAVE_FILE = "user://best_score.save"  

func _ready():
	load_best_score()  

func update_score(new_score: int):
	score = new_score
	if score > best_score:
		best_score = score
		save_best_score()  

func save_best_score():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	file.store_var(best_score)  
	file.close()

func load_best_score():
	if FileAccess.file_exists(SAVE_FILE):
		var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
		best_score = file.get_var()  
		file.close()
