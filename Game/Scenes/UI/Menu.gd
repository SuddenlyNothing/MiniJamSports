extends Control

onready var anim_player := $AnimationPlayer

func _on_Play_pressed():
	anim_player.play("Play")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Back_pressed():
	anim_player.play_backwards("Play")


func set_buttons_disabled(is_disabled : bool) -> void:
	for button in get_tree().get_nodes_in_group("moving_button"):
		button.disabled = is_disabled


func _on_AnimationPlayer_animation_finished(anim_name):
	set_buttons_disabled(false)


func _on_AnimationPlayer_animation_started(anim_name):
	set_buttons_disabled(true)


func _on_CreditsBack_pressed():
	anim_player.play_backwards("Credits")


func _on_Credits_pressed():
	anim_player.play("Credits")
