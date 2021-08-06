tool
extends StaticBody2D

var CannonBall := preload("res://Scenes/Obstacles/CannonBall.tscn")

export(int, "Up", "Down", "Left", "Right") var facing setget set_facing
export(float) var shoot_time := 1.0 setget set_shoot_time

onready var cannon_ball_position := $Barrel/Position2D

func set_facing(dir) -> void:
	facing = dir
	var barrel := $Barrel
	match dir:
		0:
			barrel.rotation_degrees = 0
		1:
			barrel.rotation_degrees = 180
		2:
			barrel.rotation_degrees = 270
		3:
			barrel.rotation_degrees = 90

func set_shoot_time(time):
	var shoot_timer := $ShootTimer
	shoot_time = time
	shoot_timer.wait_time = time


func _on_ShootTimer_timeout():
	var cannon_ball := CannonBall.instance()
	var dir := Vector2.UP.rotated(deg2rad($Barrel.rotation_degrees))
	cannon_ball.init(cannon_ball_position.global_position, dir)
	get_parent().add_child(cannon_ball)
