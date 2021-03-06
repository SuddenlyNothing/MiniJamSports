extends Area2D

const PULL_FORCE := 100


func _on_Timer_timeout():
	var bodies := get_overlapping_bodies()
	for body in bodies:
		if not body is RigidBody2D:
			continue
		body.apply_central_impulse(body.global_position.direction_to(global_position) * PULL_FORCE)
