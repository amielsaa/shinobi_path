extends Area2D

@export var resource : AbilityResource
@export var projectile_scene : PackedScene
@onready var timer = $Timer

var base_damage = 1 

# Called when the node enters the scene tree for the first time.
func _ready():
	projectile_scene = resource.ability_scene
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		if timer.is_stopped():
			shoot()
			timer.start()
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)
	else:
		timer.stop()
		
func shoot():
	print(resource.base_damage)
	var new_projectile = projectile_scene.instantiate()
	new_projectile.global_position = %ShootingPoint.global_position
	new_projectile.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_projectile)





func _on_timer_timeout():
	shoot()
