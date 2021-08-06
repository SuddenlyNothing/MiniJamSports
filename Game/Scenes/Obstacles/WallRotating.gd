tool
extends StaticBody2D

export(int, "Up", "Down", "Left", "Right") var facing := 0 setget set_facing
export(float) var angular_velocity := 5

onready var wall := $Wall

func _physics_process(delta : float) -> void:
	wall.set_angular_velocity(angular_velocity)


func set_facing(dir : int) -> void:
	facing = dir
	if Engine.editor_hint:
		match facing:
			0:
				wall.rotation_degrees = 270
			1:
				wall.rotation_degrees = 90
			2:
				wall.rotation_degrees = 180
			3:
				wall.rotation_degrees = 0
