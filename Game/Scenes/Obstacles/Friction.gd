extends Area2D

var original_damp = {}

func _on_Friction_body_entered(body) -> void:
	if not body is RigidBody2D:
		return
	var body_damp = body.get_linear_damp()
	original_damp[body] = body_damp
	body.set_linear_damp(body_damp * 10)


func _on_Friction_body_exited(body) -> void:
	if not body in original_damp:
		return
	body.set_linear_damp(original_damp[body])
	original_damp.erase(body)
