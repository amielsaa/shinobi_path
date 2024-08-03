extends Node2D
class_name MobSpawner

func damage_health_multiplier(element_type):
	match element_type:
			Spawner.ELEMENT_TYPE.FIRE:
				return ( SkillTreeVariables.fire_skill_points + 2 )/ 2
			Spawner.ELEMENT_TYPE.ICE:
				return ( SkillTreeVariables.ice_skill_points + 2 ) / 2
			Spawner.ELEMENT_TYPE.METAL:
				return ( SkillTreeVariables.metal_skill_points + 2 ) / 2
	

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
	#new_mob.resource.damage = new_mob.resource.damage * damage_health_multiplier(element_type)
	#new_mob.resource.health = new_mob.resource.health * damage_health_multiplier(element_type)
	#print(new_mob.resource.damage)
	return new_mob
