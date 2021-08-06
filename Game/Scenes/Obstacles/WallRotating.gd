tool
extends WallRotate

export(float) var angular_velocity := 5

onready var wall := $Wall

func _physics_process(delta : float) -> void:
	wall.set_angular_velocity(angular_velocity)



