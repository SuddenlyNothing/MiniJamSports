extends Area2D

const MOVE_SPEED := 100

signal caught_player

onready var screen := get_viewport_rect().size

export(NodePath) var player_node_path
var player

var started := false
var size := Vector2(64, 64)

func _physics_process(delta : float) -> void:
	if not started:
		return
	if player == null:
		player = get_node_or_null(player_node_path)
		return
	var dir = position.direction_to(player.position)
	var speed := MOVE_SPEED
	if position.x + size.x < player.position.x - screen.x / 2 \
		or position.x - size.x > player.position.x + screen.x / 2 \
		or position.y + size.y < player.position.y - screen.y / 2 \
		or position.y - size.y > player.position.y + screen.y / 2:
		speed *= 10
	position += dir * speed * delta

func _on_Area2D_body_entered(body):
	if player == null:
		return
	if body == player:
		emit_signal("caught_player")
