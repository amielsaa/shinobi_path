extends Control


@export var resource: AbilityResource
@export var element_type: Spawner.ELEMENT_TYPE
# Called when the node enters the scene tree for the first time.
func _ready():
	set_resource_for_each_button(get_children()) 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	match element_type:
		Spawner.ELEMENT_TYPE.ICE:
			%SkillPointsLabel.text = 'ICE           SKILL           POINTS:      ' + str(SkillTreeVariables.ice_skill_points)
		Spawner.ELEMENT_TYPE.FIRE:
			%SkillPointsLabel.text = 'FIRE           SKILL           POINTS:      ' + str(SkillTreeVariables.fire_skill_points)
		Spawner.ELEMENT_TYPE.METAL:
			%SkillPointsLabel.text = 'METAL           SKILL           POINTS:      ' + str(SkillTreeVariables.metal_skill_points)


func set_resource_for_each_button(children_tree):
	for children in children_tree:
		if children is SkillNode:
			children.resource = resource
		set_resource_for_each_button(children.get_children())
	


