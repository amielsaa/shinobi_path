extends ProgressBar

@export var level: int
@export var experience: int
@export var element_type: Spawner.ELEMENT_TYPE
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_level_text(level):
	$LevelNode/LevelLabel.text = str(level)
