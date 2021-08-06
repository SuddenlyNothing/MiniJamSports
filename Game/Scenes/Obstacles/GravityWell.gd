extends Area2D

const PULL_FORCE := 100

#func _physics_process(delta : float) -> void:
#	var bodies := get_overlapping_bodies()
#	for body in bodies:
#		if not body is RigidBody2D:
#			continue
#		body.add_force(Vector2(), body.position.direction_to(position) * PULL_FORCE)
#
#
#func _on_GravityWell_body_exited(body):
#	if not body is RigidBody2D:
#		return
#	print("bye")
#	body.set_applied_force(Vector2())


func _on_Timer_timeout():
	var bodies := get_overlapping_bodies()
	for body in bodies:
		if not body is RigidBody2D:
			continue
		body.apply_central_impulse(body.position.direction_to(position) * PULL_FORCE)
