extends Path2D

signal caught_player

export(float) var fog_speed = 100.0

onready var path_follow := $PathFollow2D
onready var particles := $PathFollow2D/Particles2D
onready var line := $Node/Line2D
onready var line_timer := $LineTimer

var started := false setget set_started

func set_started(val : bool) -> void:
	started = val
	particles.emitting = true
	line_timer.start()

func _physics_process(delta : float) -> void:
	if not started:
		return
	path_follow.offset += fog_speed * delta


func _on_Area2D_body_entered(body):
	if not body.is_in_group("player"):
		return
	emit_signal("caught_player")


func _on_Timer_timeout():
	var updated_points = line.points
	updated_points.append(path_follow.global_position)
	line.points = updated_points
