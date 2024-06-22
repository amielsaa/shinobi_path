extends CharacterBody2D

signal health_depleted

var health = 100.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") # Calculates direction vector as 2d value
	velocity = direction * 600 # move at the input direction at 600 pixel per second
	move_and_slide()

	if velocity.length() > 0.0:
		%Ninja.play_walk_animation(direction)
	else:
		%Ninja.play_idle_animation(direction)

	const DAMAGE_RATE = 10.0
	var overalapping_mobs = %HurtBox.get_overlapping_bodies()
	if overalapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overalapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
