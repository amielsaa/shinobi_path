extends Node2D

@onready var pathFollow2D = %TileMap/Player/Path2D/PathFollow2D
@onready var gameOver = $GameOver

var is_game_over = false
var bossMobFlag = false
var active_spawner_totems: int = 3
var spawn_type = Spawner.ELEMENT_TYPE.METAL

func spawn_mob():
	var mob_spawner = preload("res://characters/mobs/mob_spawner.gd").new()
	%PathFollow2D.progress_ratio = randf()
	var new_mob = mob_spawner.spawn_mob(spawn_type, bossMobFlag)
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
	#var shape_index = area.shape_owner_get_owner(area.get_shape_index())
	#if area == $BossArea:
		#if area.get_meta("identifier") == "bossMobs":
		#bossMobFlag = true
		#print("boss mob flag is true1")
	#elif area.shape_owner_get_owner(0).get_meta("identifier") == "bossMobs":
		#
		#bossMobFlag = true
		#print("boss mob flag is true2")
	#else :
		#bossMobFlag = false
		#print("boss mob flag is false")
	#for shape in area.get_children():
		#if shape.has_method("get_meta"):
			#if shape.get_meta("identifier") == "bossMobs":
				#bossMobFlag = true
				#print("boss mob flag is true")
			#else:
				#bossMobFlag = false
				#print("boss mob flag is false")
	if area.area_zone_type == Spawner.MOB_TYPE_ZONE.BOSS:
		bossMobFlag = true
	spawn_type = area.type



func _on_area_2d_area_exited(area):
	if area.area_zone_type == Spawner.MOB_TYPE_ZONE.BOSS:
		bossMobFlag = false
		
func spawn_destroyed(element_type: Spawner.ELEMENT_TYPE):
	active_spawner_totems -= 1
	if active_spawner_totems <= 0:
		#transition to 'YOU WON' screen
		print('you won')

