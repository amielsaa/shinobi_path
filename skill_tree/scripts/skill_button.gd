extends TextureButton
class_name SkillNode

## SkillNode is a button that we instatiate manually in each skill tree we build

enum EnhanceType {QUANTITY, DAMAGE}

@onready var panel = $Panel
@onready var line_2d = $Line2D

@export var sprite: Texture2D 
@export var enhance_type: EnhanceType = EnhanceType.DAMAGE
@export var enhance_value: int = 0
@export var resource: AbilityResource

var skill_enabled = false

func _ready():
	#adds a line between each node in the skill tree
	if get_parent() is SkillNode:
		line_2d.add_point(global_position + size/2)
		line_2d.add_point(get_parent().global_position + size/2)
	texture_normal = sprite

func _on_pressed():
	#if SkillTreeVariables.skill_points <= 0:
		#return
	#SkillTreeVariables.skill_points -= 1
	var decrement_succeed = SkillTreeVariables.decrement_skill_points_by_type(resource.element_type)
	if !decrement_succeed:
		return
	
	skill_enabled = true 
	panel.show_behind_parent = true ## making the panel (shadow) invisible
	disabled = true ## unable to press it again
	line_2d.default_color = Color(1, 1, 0.24) ## color of the line between each node (once pressed)
	
	apply_skill_enhancment()
	
	var skills = get_children()
	
	for skill in skills:
		if skill is SkillNode and skill_enabled:
			skill.disabled = false
	

func apply_skill_enhancment():

	match enhance_type:
		EnhanceType.QUANTITY:
			print("quantity")
			resource.quantity += enhance_value
		EnhanceType.DAMAGE:
			print("damage")
			resource.base_damage += enhance_value
		

			
