extends Area2D

export(float) var bounce_force = 750.0

func _on_Bounce_body_entered(body):
	if not body is RigidBody2D:
		return
	body.apply_central_impulse(global_position.direction_to(body.global_position) * bounce_force)
