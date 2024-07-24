extends Node2D

@onready var pathFollow2D = %TileMap/Player/Path2D/PathFollow2D
@onready var gameOver = $GameOver
var is_game_over = false
var spawn_type = Spawner.ELEMENT_TYPE.METAL
func spawn_mob():
	var mob_spawner = preload("res://characters/mobs/mob_spawner.gd").new()
	%PathFollow2D.progress_ratio = randf()
	var new_mob = mob_spawner.spawn_mob(spawn_type)
	new_mob.global_position = %PathFollow2D.global_position
	$TileMap.add_child(new_mob)
	$TileMap.move_child(new_mob, 0)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	if !is_game_over:
		is_game_over = true
		get_tree().change_scene_to_file("res://game_over.tscn")
	



func _on_area_2d_area_entered(area):
	spawn_type = area.type
	print(spawn_type)
