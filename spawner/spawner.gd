extends Area2D
class_name Spawner

enum ELEMENT_TYPE {ICE, FIRE, METAL}

#var s = SkillTreeVariables.ELEMEN
@export var type: ELEMENT_TYPE

# Called when the node enters the scene tree for the first time.
func _ready():
	$RegularMobs.set_meta("identifier","regularMobs")
	$BossArea.set_meta("identifier","bossMobs")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

