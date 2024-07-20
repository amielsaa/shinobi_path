extends Node2D

@export var resource : AbilityResource
@export var circular_scene : PackedScene
var active_circular_scenes = []
@onready var circular_spawn = $CircularSpawn
# Called when the node enters the scene tree for the first time.
func _ready():
	circular_scene = resource.ability_scene
	add_quantity(resource.quantity)

func _physics_process(delta):
	## checks if the resource changed to instantiate a new circular scene
	## usually the skill tree initiate a resource change
	var number_of_active_circular_scenes = len(circular_spawn.get_children())
	if resource.quantity > number_of_active_circular_scenes:
		add_quantity(resource.quantity - number_of_active_circular_scenes)

func instantiate_circular_scene():
	var new_circular_scene = circular_scene.instantiate()
	new_circular_scene.resource = resource
	return new_circular_scene

func add_damage(damage_to_add):
	resource.base_damage += damage_to_add
	
func add_quantity(quantity=1):
	for i in range(quantity):
		var new_circular_scene = instantiate_circular_scene()
		circular_spawn.add_child(new_circular_scene)
	adjust_rotation_children_scenes()


## called by add_quantity()
## reorganize the current active circular scenes 
func adjust_rotation_children_scenes():
	var rotation_increment = 360 / circular_spawn.get_children().size()
	var rotation_value = 0
	for active_scene in circular_spawn.get_children():
		active_scene.rotation_degrees = rotation_value
		rotation_value += rotation_increment  



#func _on_timer_for_test_timeout():
	#add_damage(1)
