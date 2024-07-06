extends TextureButton
class_name SkillNode

@onready var panel = $Panel
@onready var line_2d = $Line2D


var skill_enabled = false

func _ready():
	if get_parent() is SkillNode:
		line_2d.add_point(global_position + size/2)
		line_2d.add_point(get_parent().global_position + size/2)

func _on_pressed():
	skill_enabled = true
	panel.show_behind_parent = true
	
	line_2d.default_color = Color(1, 1, 0.24)
	
	var skills = get_children()
	
	for skill in skills:
		if skill is SkillNode and skill_enabled:
			skill.disabled = false
