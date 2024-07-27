extends Node2D
class_name MobSpawner

#
#func spawn_mob(y_position):
	#var new_mob = preload("res://mob.tscn").instantiate()
	#if y_position > 500:
		#new_mob.resource = ResourceLoader.load("res://characters/resources/beast.tres")
	#else:
		#new_mob.resource = ResourceLoader.load("res://characters/resources/axolot.tres")
	#return new_mob


func spawn_mob(element_type, bossMobFlag):
	var new_mob = preload("res://mob.tscn").instantiate()
	if bossMobFlag:
		match element_type:
			Spawner.ELEMENT_TYPE.FIRE:
				new_mob.resource = ResourceLoader.load("res://characters/resources/monsters/cyclope_fire_boss.tres")
			Spawner.ELEMENT_TYPE.ICE:
				new_mob.resource = ResourceLoader.load("res://characters/resources/monsters/bat_boss_ice.tres")
			Spawner.ELEMENT_TYPE.METAL:
				new_mob.resource = ResourceLoader.load("res://characters/resources/monsters/trex_metal_boss.tres")
	else :
		match element_type:
			Spawner.ELEMENT_TYPE.FIRE:
				new_mob.resource = ResourceLoader.load("res://characters/resources/monsters/beast.tres")
			Spawner.ELEMENT_TYPE.ICE:
				new_mob.resource = ResourceLoader.load("res://characters/resources/monsters/axolot.tres")
			Spawner.ELEMENT_TYPE.METAL:
				new_mob.resource = ResourceLoader.load("res://characters/resources/monsters/lizard_metal.tres")
	return new_mob
