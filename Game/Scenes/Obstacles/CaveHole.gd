extends Node2D

signal player_entered


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_entered")
