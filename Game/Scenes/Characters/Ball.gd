extends RigidBody2D

signal started

export(int) var ball_thrust := 500

var thrust := Vector2()
var started := false

func _process(_delta : float) -> void:
	var dir := get_input()
	if not started:
		return
	if dir == Vector2() and linear_velocity == Vector2():
		print("haha die")
	thrust = dir.normalized() * ball_thrust

func _physics_process(delta : float) -> void:
	if not started:
		return
	set_applied_force(thrust)


func get_input() -> Vector2:
	var dir := Vector2()
	if Input.is_action_pressed("move_down"):
		dir.y += 1
	if Input.is_action_pressed("move_left"):
		dir.x -= 1
	if Input.is_action_pressed("move_right"):
		dir.x += 1
	if Input.is_action_pressed("move_up"):
		dir.y -= 1
	if not started and dir != Vector2():
		emit_signal("started")
		started = true
	return dir
