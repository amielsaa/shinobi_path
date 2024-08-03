extends CharacterBody2D

const SKILL_POINTS_PER_LEVEL: int = 1
const EXPERIENCE_MULTIPLIER: float = 2.10

signal health_depleted
signal score_added(score_value)

@onready var playerUi = $Camera2D/PlayerUI
@onready var abilityManager = $AbilityManager
@onready var skillTreeMenu = $SkillTreeMenu
@onready var iceExperienceBar = %IceExperienceBar
@onready var fireExperienceBar = %FireExperienceBar
@onready var metalExperienceBar = %MetalExperienceBar

var health = 1.0

var ice_experience = 0
var fire_experience = 0
var metal_experience = 0

var level = 1

func _ready():
	var ability_resource = ResourceLoader.load("res://abilities/shuriken/shuriken.tres")
	abilityManager.add_ability(ability_resource)

	var ability_resource_fireball = ResourceLoader.load("res://abilities/fireball/fireball.tres")
	abilityManager.add_ability(ability_resource_fireball)
	
	var ability_resource_ice = ResourceLoader.load("res://abilities/ice/ice.tres")
	abilityManager.add_ability(ability_resource_ice)
	
	var shuriken_skill_tree_scene = preload("res://skill_tree/scenes/skill_tree.tscn").instantiate()
	skillTreeMenu.add_skill_tree(shuriken_skill_tree_scene, ability_resource)
	
	var fireball_skill_tree_scene = preload("res://skill_tree/scenes/fire_ball_tree.tscn").instantiate()
	skillTreeMenu.add_skill_tree(fireball_skill_tree_scene, ability_resource_fireball)

	var ice_skill_tree_scene = preload("res://skill_tree/scenes/ice_skill_tree.tscn").instantiate()
	skillTreeMenu.add_skill_tree(ice_skill_tree_scene, ability_resource_ice)


	

func _unhandled_input(event):
	if event.is_action_pressed("skill_tree"):
		skillTreeMenu.pause()

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") # Calculates direction vector as 2d value
	velocity = direction * 80 # move at the input direction at 600 pixel per second
	move_and_slide()
	
	update_experience_bars()
	
	if velocity.length() > 0.0:
		%Ninja.play_walk_animation(direction)
	else:
		%Ninja.play_idle_animation(direction)

	var overalapping_mobs = %HurtBox.get_overlapping_bodies().filter(func(body): if body is CharacterBody2D: return body)
	for overlapped in overalapping_mobs:
		health -= overlapped.resource.damage * delta
		%Ninja.play_hit_animation()
		%ProgressBar.value = health
		if health <= 0.0:
			playerUi.save_score()
			health_depleted.emit()
	
	%Ninja.play_disable_hit()


func update_experience_bars():
	iceExperienceBar.value = iceExperienceBar.experience
	fireExperienceBar.value = fireExperienceBar.experience
	metalExperienceBar.value = metalExperienceBar.experience
	if iceExperienceBar.experience >= iceExperienceBar.max_value:
		level_up(iceExperienceBar)
	if fireExperienceBar.experience >= fireExperienceBar.max_value:
		level_up(fireExperienceBar)
	if metalExperienceBar.experience >= metalExperienceBar.max_value:
		level_up(metalExperienceBar) 
	
func level_up(experienceBar):
	experienceBar.min_value = experienceBar.max_value
	experienceBar.max_value = experienceBar.max_value * EXPERIENCE_MULTIPLIER
	experienceBar.level += 1
	experienceBar.set_level_text(experienceBar.level)
	#SkillTreeVariables.skill_points += SKILL_POINTS_PER_LEVEL
	SkillTreeVariables.inrement_skill_points_by_type(experienceBar.element_type, SKILL_POINTS_PER_LEVEL)
	skillTreeMenu.pause(experienceBar.ability_name)

func killed_mob(resource):
	match resource.type:
		Spawner.ELEMENT_TYPE.FIRE:
			fireExperienceBar.experience += resource.damage
		Spawner.ELEMENT_TYPE.ICE:
			iceExperienceBar.experience += resource.damage
		Spawner.ELEMENT_TYPE.METAL:
			metalExperienceBar.experience += resource.damage
		
	playerUi.update_score(resource.damage)


