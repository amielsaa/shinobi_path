extends CanvasLayer


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		unpause()

func unpause():
	get_tree().paused = false
	visible = false


func pause():
	visible = true
	get_tree().paused = true

