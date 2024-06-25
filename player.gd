extends CharacterBody2D

signal health_depleted
signal score_added(score_value)

@onready var playerUi = $Camera2D/PlayerUI

var health = 100.0


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

