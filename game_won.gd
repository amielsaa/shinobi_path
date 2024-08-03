extends Control


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")

func _on_instruction_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://survivors_game.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://MainMenu.tscn")

