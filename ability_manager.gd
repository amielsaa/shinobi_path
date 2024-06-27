extends Node2D

var abilities = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass

func add_ability(ability_resource: AbilityResource):
	abilities.append(ability_resource)
	match ability_resource.ability_type:
		AbilityResource.AbilityType.PROJECTILE:
			var projectile = preload("res://abilities/projectile.tscn").instantiate()
			projectile.resource = ability_resource
			add_child(projectile)

	

