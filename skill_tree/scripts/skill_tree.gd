extends Control


@export var resource: AbilityResource

# Called when the node enters the scene tree for the first time.
func _ready():
	set_resource_for_each_button(get_children()) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_resource_for_each_button(children_tree):
	for children in children_tree:
		if children is SkillNode:
			children.resource = resource
		set_resource_for_each_button(children.get_children())
	


