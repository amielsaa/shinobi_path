extends Area2D
class_name FireballAbility

var radius = 30
var speed = 4
@export var resource: AbilityResource
@onready var collisionShape = $CollisionShape2D
@onready var sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	collisionShape.position.x = radius
	sprite.position.x = radius


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += delta * speed
	

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(resource.base_damage)
