extends Node2D

onready var death_fog := $DeathFog

func _on_DeathFog_caught_player():
	Global.restart_scene()


func _on_Ball_started():
	death_fog.started = true


