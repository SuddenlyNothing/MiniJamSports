extends Area2D

const BOUNCE_FORCE := 2000

func _on_Bounce_body_entered(body):
	if not body is RigidBody2D:
		return
	body.apply_central_impulse(global_position.direction_to(body.global_position) * BOUNCE_FORCE)
