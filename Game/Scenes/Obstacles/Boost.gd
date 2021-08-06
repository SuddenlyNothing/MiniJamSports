tool
extends Area2D

const BOOST_FORCE := 100

export(int, "Right", "Down", "Left", "Up") var facing := 0 setget set_facing

func set_facing(val) -> void:
	facing = val
	match facing:
		0:
			rotation_degrees = 0
		1:
			rotation_degrees = 90
		2:
			rotation_degrees = 180
		3:
			rotation_degrees = 270


func _on_Timer_timeout():
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if not body is RigidBody2D:
			continue
		var dir := Vector2()
		match facing:
			0:
				dir.x += 1
			1:
				dir.y += 1
			2:
				dir.x -= 1
			3:
				dir.y -= 1
		body.apply_central_impulse(dir * BOOST_FORCE)
