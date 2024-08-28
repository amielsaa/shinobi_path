extends CanvasLayer

var is_music_muted = false
@onready var mute_button = $"Control/VBoxContainer/MuteMusic"


func _unhandled_input(event):
	if event.is_action_pressed("exit_pause_menu"):
		unpause()


func unpause():
	process_mode = Node.PROCESS_MODE_INHERIT
	get_tree().paused = false
	visible = false

func pause():
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	visible = true
	get_tree().paused = true


func _on_restart_game_pressed():
	print("game restart pressed")
	process_mode = Node.PROCESS_MODE_INHERIT
	get_tree().paused = false
	get_tree().change_scene_to_file("res://survivors_game.tscn")
	


func _on_return_to_menu_pressed():
	print("game return to menu pressed")
	process_mode = Node.PROCESS_MODE_INHERIT
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_mute_music_pressed():
	if is_music_muted:
		GlobalAudioStreamPlayer.play()
		mute_button.text = "Mute Music"
	else:
		GlobalAudioStreamPlayer.stop()
		mute_button.text = "Unmute Music"

	is_music_muted = !is_music_muted
