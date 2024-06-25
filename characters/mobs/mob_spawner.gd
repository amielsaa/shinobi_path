extends Node2D
class_name MobSpawner


func spawn_mob(y_position):
	var new_mob = preload("res://mob.tscn").instantiate()
	if y_position > 500:
		new_mob.resource = ResourceLoader.load("res://characters/resources/beast.tres")
	else:
		new_mob.resource = ResourceLoader.load("res://characters/resources/axolot.tres")
	return new_mob
