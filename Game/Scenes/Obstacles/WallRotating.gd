extends StaticBody2D

onready var wall := $Wall

func _physics_process(delta : float) -> void:
	wall.set_angular_velocity(5)
