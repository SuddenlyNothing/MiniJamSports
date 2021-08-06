extends RigidBody2D

var dir := Vector2()
var force := 500

func init(pos : Vector2, d : Vector2, f : int = 500) -> void:
	position = pos
	dir = d.normalized()
	force = f


func _ready() -> void:
	apply_central_impulse(dir * force)


func _on_FreeTimer_timeout():
	queue_free()
