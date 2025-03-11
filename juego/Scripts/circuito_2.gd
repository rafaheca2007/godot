extends Node2D


var a = 500
var b = 200

for angle in range(0, 360, 5):
	var x = a * cos(deg2rad(angle))
	var y = b * sin(deg2grad(angle))
	tile_map.set_cell(0, Vector2i(x, y), 0, Vector2i(0,0))
