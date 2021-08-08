extends Node2D

export(String, FILE, "*.tscn") var next_scene

onready var death_fog := $DeathFog

func _on_Ball_started():
	death_fog.started = true


func _on_DeathFog_caught_player():
	Global.restart_scene()


func _on_CaveHole_player_entered():
	Global.goto_scene(next_scene)
