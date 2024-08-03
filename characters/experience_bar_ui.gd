extends ProgressBar

@export var level: int
@export var experience: int
@export var element_type: Spawner.ELEMENT_TYPE
@export var ability_name: String
@export var ground_texture: Texture2D
# Called when the node enters the scene tree for the first time.
func _ready():
	$GroundSprite.texture = ground_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_level_text(level):
	$LevelNode/LevelLabel.text = str(level)

func set_totem_destroyed():
	$GroundSprite/TotemDestroyed.visible = true
