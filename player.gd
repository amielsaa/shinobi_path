extends CharacterBody2D

signal health_depleted
signal score_added(score_value)

@onready var playerUi = $Camera2D/PlayerUI
@onready var abilityManager = $AbilityManager
@onready var skillTreeMenu = $SkillTreeMenu
var health = 100.0

func _ready():
	var ability_resource = ResourceLoader.load("res://abilities/shuriken/shuriken.tres")
	abilityManager.add_ability(ability_resource)

	var ability_resource_fireball = ResourceLoader.load("res://abilities/fireball/fireball.tres")
	abilityManager.add_ability(ability_resource_fireball)
	
	var ability_resource_thunder = ResourceLoader.load("res://abilities/thunder/thunder.tres")
	abilityManager.add_ability(ability_resource_thunder)

	

func _unhandled_input(event):
	if event.is_action_pressed("skill_tree"):
		skillTreeMenu.pause()

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") # Calculates direction vector as 2d value
	velocity = direction * 80 # move at the input direction at 600 pixel per second
	move_and_slide()
	
	
	
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


func killed_mob(resource):
	playerUi.update_score(resource.damage)

