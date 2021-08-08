extends Node2D

onready var death_fog := $DeathFog

func _on_Ball_started():
	death_fog.started = true
