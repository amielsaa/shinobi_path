extends Node2D
var main_menu_scene: PackedScene = preload("res://MainMenu.tscn")

func _ready():
	
	$AnimationPlayer.play("fade in")
	await get_tree().create_timer(4.5).timeout
	$AnimationPlayer.play("fade out")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_packed(main_menu_scene)

