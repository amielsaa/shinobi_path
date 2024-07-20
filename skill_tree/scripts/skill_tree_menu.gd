extends CanvasLayer
#add here function to add a resource to skilltree

func _physics_process(delta):
	%SkillPointsLabel.text = 'SKILL           POINTS:      ' + str(SkillTreeVariables.skill_points)

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		unpause()

func unpause():
	get_tree().paused = false
	visible = false


func pause():
	visible = true
	get_tree().paused = true

func add_skill_tree(new_skill_tree_scene: Node,resource: AbilityResource):
	new_skill_tree_scene.resource = resource
	var new_bar = TabBar.new()
	new_bar.name = resource.ability_name
	new_bar.add_child(new_skill_tree_scene)
	%TabContainer.add_child(new_bar)
	#%SHURIKEN.add_child(new_skill_tree_scene)
	#add_child(new_skill_tree_scene)
