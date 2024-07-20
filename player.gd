extends CharacterBody2D

const SKILL_POINTS_PER_LEVEL: int = 1
const EXPERIENCE_MULTIPLIER: int = 2.10

signal health_depleted
signal score_added(score_value)

@onready var playerUi = $Camera2D/PlayerUI
@onready var abilityManager = $AbilityManager
@onready var skillTreeMenu = $SkillTreeMenu
@onready var experienceBar = $ExperienceBar

var health = 100.0
var experience = 0
var level = 1

func _ready():
	var ability_resource = ResourceLoader.load("res://abilities/shuriken/shuriken.tres")
	abilityManager.add_ability(ability_resource)

	var ability_resource_fireball = ResourceLoader.load("res://abilities/fireball/fireball.tres")
	abilityManager.add_ability(ability_resource_fireball)
	
	var ability_resource_thunder = ResourceLoader.load("res://abilities/thunder/thunder.tres")
	abilityManager.add_ability(ability_resource_thunder)
	
	var shuriken_skill_tree_scene = preload("res://skill_tree/scenes/skill_tree.tscn").instantiate()
	skillTreeMenu.add_skill_tree(shuriken_skill_tree_scene, ability_resource)
	
	var fireball_skill_tree_scene = preload("res://skill_tree/scenes/fire_ball_tree.tscn").instantiate()
	skillTreeMenu.add_skill_tree(fireball_skill_tree_scene, ability_resource_fireball)

	var thunder_skill_tree_scene = preload("res://skill_tree/scenes/thunder_skill_tree.tscn").instantiate()
	skillTreeMenu.add_skill_tree(thunder_skill_tree_scene, ability_resource_thunder)


	

func _unhandled_input(event):
	if event.is_action_pressed("skill_tree"):
		skillTreeMenu.pause()

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") # Calculates direction vector as 2d value
	velocity = direction * 80 # move at the input direction at 600 pixel per second
	move_and_slide()
	
	
	experienceBar.value = experience
	if experience >= experienceBar.max_value:
		level_up()
	
	if velocity.length() > 0.0:
		%Ninja.play_walk_animation(direction)
	else:
		%Ninja.play_idle_animation(direction)

	var overalapping_mobs = %HurtBox.get_overlapping_bodies()
	for overlapped in overalapping_mobs:
		health -= overlapped.resource.damage * delta
		%ProgressBar.value = health
		if health <= 0.0:
			playerUi.save_score()
			health_depleted.emit()

func level_up():
	experienceBar.min_value = experienceBar.max_value
	experienceBar.max_value = experienceBar.max_value * EXPERIENCE_MULTIPLIER
	level += 1
	%LevelLabel.text = str(level)
	SkillTreeVariables.skill_points += SKILL_POINTS_PER_LEVEL
	skillTreeMenu.pause()

func killed_mob(resource):
	experience += resource.damage
	playerUi.update_score(resource.damage)

