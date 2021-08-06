extends Area2D

const EXPLOSION_FORCE := 500

onready var animated_sprite := $AnimatedSprite
onready var collision_shape := $CollisionShape2D

func _ready() -> void:
	animated_sprite.play("explode")

func _on_Explosion_body_entered(body):
	if body is RigidBody2D:
		body.apply_central_impulse(position.direction_to(body.position) * EXPLOSION_FORCE)


func _on_AnimatedSprite_animation_finished():
	queue_free()


func _on_ActiveTimer_timeout():
	collision_shape.call_deferred("set_disabled", true)
