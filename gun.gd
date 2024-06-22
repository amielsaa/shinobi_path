extends Area2D



func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)



func shoot():
	const SHURIKEN = preload("res://abilities/shuriken/shuriken.tscn")
	var new_shuriken = SHURIKEN.instantiate()
	new_shuriken.global_position = %ShootingPoint.global_position
	new_shuriken.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_shuriken)


func _on_timer_timeout():
	shoot()
