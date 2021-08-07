extends Button
class_name ButtonDefault

onready var click_sfx := $ClickSFX

func _on_Button_pressed():
	click_sfx.play()
