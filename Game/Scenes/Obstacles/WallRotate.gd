tool
extends StaticBody2D
class_name WallRotate

export(int, "Up", "Down", "Left", "Right") var facing := 0 setget set_facing

func set_facing(dir : int) -> void:
	var wall := $Wall
	facing = dir
	match facing:
		0:
			wall.rotation_degrees = 270
		1:
			wall.rotation_degrees = 90
		2:
			wall.rotation_degrees = 180
		3:
			wall.rotation_degrees = 0
