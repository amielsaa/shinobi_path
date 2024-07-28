extends Node


var fire_skill_points: int = 1
var ice_skill_points: int = 1
var metal_skill_points: int = 1


func decrement_skill_points_by_type(element_type: Spawner.ELEMENT_TYPE):
	print(element_type)
	match element_type:
		Spawner.ELEMENT_TYPE.ICE:
			print('ice')
			if ice_skill_points > 0:
				ice_skill_points -= 1
				return true
		Spawner.ELEMENT_TYPE.FIRE:
			print('fire')
			if fire_skill_points > 0:
				fire_skill_points -= 1
				return true
		Spawner.ELEMENT_TYPE.METAL:
			print('metal')
			if metal_skill_points > 0:
				metal_skill_points -= 1
				return true
	return false
	
	
func inrement_skill_points_by_type(element_type: Spawner.ELEMENT_TYPE, amount: int):
	match element_type:
		Spawner.ELEMENT_TYPE.ICE:
			ice_skill_points += amount
		Spawner.ELEMENT_TYPE.FIRE:
			fire_skill_points += amount
		Spawner.ELEMENT_TYPE.METAL:
			metal_skill_points += amount

