extends Area2D

@export var resource : AbilityResource
@export var spawn_scene : PackedScene
@onready var timer = $Timer

var base_damage = 1 
#var target_enemy_global_position = null
# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_scene = resource.ability_scene
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#var enemies_in_range = get_overlapping_bodies()
	#if enemies_in_range.size() > 0:
		#target_enemy_global_position = enemies_in_range.front().global_position
	pass
		
func spawn():
	var enemies_in_range = get_overlapping_bodies()
	for i in range(min(resource.quantity , enemies_in_range.size())):
		var target_enemy_global_position = enemies_in_range[i].global_position
		var new_spawn = spawn_scene.instantiate()
		new_spawn.resource = resource
		new_spawn.global_position = target_enemy_global_position
		add_child(new_spawn)


func _on_timer_timeout():
	spawn()
