extends Node2D

const TIMER_DECRESE_VALUE = 0.1

@onready var pathFollow2D = %TileMap/Player/Path2D/PathFollow2D
@onready var gameOver = $GameOver

#wall coordinate limit for mob spawning
const MIN_Y = -550
const MAX_Y = 2000
const MIN_X = -650
const MAX_X = 2000
const MAX_MONSTER_SPAWNS: int= 75

var is_game_over = false
var bossMobFlag = false
var active_spawner_totems: int = 3
var spawn_type = Spawner.ELEMENT_TYPE.METAL

func spawn_mob():
	var mob_spawner = preload("res://characters/mobs/mob_spawner.gd").new()
	%PathFollow2D.progress_ratio = randf()
	var new_mob = mob_spawner.spawn_mob(spawn_type, bossMobFlag)
	var path_follow_position = %PathFollow2D.global_position
	new_mob.global_position.y = clamp(path_follow_position.y, MIN_Y, MAX_Y)
	new_mob.global_position.x = clamp(path_follow_position.x, MIN_X, MAX_X)
	print(new_mob.resource.damage)
	$TileMap.add_child(new_mob)
	$TileMap.move_child(new_mob, 0)


func _on_timer_timeout():
	var alive_monsters = $TileMap.get_children().filter(func(node): return node.has_method("take_damage"))
	if alive_monsters.size() >= MAX_MONSTER_SPAWNS:
		return
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
	$Timer.wait_time -= TIMER_DECRESE_VALUE
	active_spawner_totems -= 1
	$TileMap/Player.change_spawn_ui(element_type)
	if active_spawner_totems <= 0:
		#transition to 'YOU WON' screen
		print('you won')

