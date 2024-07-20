extends Area2D

@export var resource : AbilityResource
@export var projectile_scene : PackedScene
@onready var timer = $Timer

var base_damage = 1 

var enemies_in_range = []
# Called when the node enters the scene tree for the first time.
func _ready():
	projectile_scene = resource.ability_scene
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#enemies_in_range = get_overlapping_bodies()
	if get_overlapping_bodies().size() > 0:
		if timer.is_stopped():
			shoot()
			timer.start()
	else:
		timer.stop()
		
func shoot():
	enemies_in_range = get_overlapping_bodies()
	for i in range(min(resource.quantity , enemies_in_range.size())):
		look_at(enemies_in_range[i].global_position)
		var new_projectile = projectile_scene.instantiate()
		new_projectile.resource = resource
		new_projectile.global_position = %ShootingPoint.global_position
		new_projectile.global_rotation = %ShootingPoint.global_rotation
		%ShootingPoint.add_child(new_projectile)





func _on_timer_timeout():
	shoot()
