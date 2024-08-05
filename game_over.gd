extends Control

func turn_visible():
	$GameOver.visible = true

# Called when the node enters the scene tree for the first time.
func _ready():
	SkillTreeVariables.reset_points()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://survivors_game.tscn")


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://survivors_game.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://MainMenu.tscn")


