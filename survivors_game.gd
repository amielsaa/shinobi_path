extends Node2D

@onready var pathFollow2D = %TileMap/Player/Path2D/PathFollow2D
@onready var gameOver = $GameOver
func spawn_mob():
	var mob_spawner = preload("res://characters/mobs/mob_spawner.gd").new()
	%PathFollow2D.progress_ratio = randf()
	var new_mob = mob_spawner.spawn_mob(%PathFollow2D.global_position.y)
	new_mob.global_position = %PathFollow2D.global_position
	$TileMap.add_child(new_mob)
	$TileMap.move_child(new_mob, 0)


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_depleted():
	get_tree().change_scene_to_file("res://game_over.tscn")
	


