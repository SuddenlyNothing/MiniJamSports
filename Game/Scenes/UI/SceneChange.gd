extends Button

export(String, FILE, "*.tscn") var next_scene

func _on_SceneChange_pressed():
	Global.goto_scene(next_scene)
