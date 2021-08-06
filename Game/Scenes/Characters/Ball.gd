extends RigidBody2D

export(int) var ball_thrust := 500

var thrust := Vector2()

func _process(_delta : float) -> void:
	var dir := get_input()
	thrust = dir.normalized() * ball_thrust

func _physics_process(_delta : float) -> void:
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
	return dir
