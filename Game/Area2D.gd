extends Area2D

const MOVE_SPEED := 50

signal caught_player

export(NodePath) var player_node_path
var player

func _physics_process(delta : float) -> void:
	if player == null:
		player = get_node_or_null(player_node_path)
		return
	var dir = position.direction_to(player.position)
	position += dir * MOVE_SPEED * delta

func _on_Area2D_body_entered(body):
	if player == null:
		return
	if body == player:
		emit_signal("caught_player")
