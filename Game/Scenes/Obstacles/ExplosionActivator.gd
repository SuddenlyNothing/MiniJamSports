extends Area2D

var Explosion := preload("res://Scenes/Obstacles/Explosion.tscn")

func _on_ExplosionActivator_body_entered(body):
	if body is RigidBody2D:
		explode()


func _on_ExplosionActivator_area_entered(area):
	explode()


func explode() -> void:
	var explosion := Explosion.instance()
	explosion.position = position
	get_parent().call_deferred("add_child", explosion)
	queue_free()
