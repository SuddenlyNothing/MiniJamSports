extends Area2D

export(float) var bounce_force = 750.0

onready var collision_shape := $CollisionShape2D
onready var reactivate_timer := $ReactivateTimer

var reactivate_time := 0.05

func _on_Bounce_body_entered(body) -> void:
	print("????")
	if not body is RigidBody2D:
		return
	body.apply_central_impulse(global_position.direction_to(body.global_position) * bounce_force)
	$"Collision Sound".play(0)
	
#	collision_shape.call_deferred("set_disabled", true)
#	reactivate_timer.start(reactivate_time)


func _on_ReactivateTimer_timeout():
	return
	collision_shape.call_deferred("set_disabled", false)
