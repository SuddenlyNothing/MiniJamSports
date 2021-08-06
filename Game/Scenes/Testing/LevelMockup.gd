extends Node2D

onready var player_catcher := $PlayerCatcher

func _on_PlayerCatcher_caught_player():
	Global.restart_scene()


func _on_Ball_started():
	player_catcher.started = true
