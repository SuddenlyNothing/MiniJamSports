extends Area2D

var original_damp = {}

func _on_Ice_body_entered(body):
	if not body is RigidBody2D:
		return
	var body_damp = body.get_linear_damp()
	original_damp[body] = body_damp
	body.set_linear_damp(0)


func _on_Ice_body_exited(body):
	if not body in original_damp:
		return
	body.set_linear_damp(original_damp[body])
	print(original_damp[body])
	original_damp.erase(body)

