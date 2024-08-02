extends CanvasLayer
#add here function to add a resource to skilltree

func _physics_process(delta):
	pass


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		unpause()

func unpause():
	get_tree().paused = false
	visible = false


func pause(element_name=null):
	visible = true
	get_tree().paused = true
	if element_name:
		#i changed it to this implementation because i had a bug
		#where the 'match' didnt entered the 'ice' code block
		#when ta
		match element_name:
			"ICE":
				%TabContainer.current_tab = 2
			"FIRE":
				%TabContainer.current_tab = 1
			"METAL":
				%TabContainer.current_tab = 0
		#match element_type:
			#Spawner.ELEMENT_TYPE.ICE:
				#print("ice")
				#%TabContainer.current_tab = 2
			#Spawner.ELEMENT_TYPE.FIRE:
				#print("fire")
				#%TabContainer.current_tab = 1
			#Spawner.ELEMENT_TYPE.METAL:
				#print("metal")
				#%TabContainer.current_tab = 0

func add_skill_tree(new_skill_tree_scene: Node,resource: AbilityResource):
	new_skill_tree_scene.resource = resource
	var new_bar = TabBar.new()
	new_bar.name = resource.ability_name
	new_bar.add_child(new_skill_tree_scene)
	%TabContainer.add_child(new_bar)
	#%SHURIKEN.add_child(new_skill_tree_scene)
	#add_child(new_skill_tree_scene)
