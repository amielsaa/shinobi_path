extends Control


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")


func _on_instruction_button_pressed():
	get_tree().change_scene_to_file("res://how_to_play.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
