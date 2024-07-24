extends Area2D

var travelled_distance = 0

@export var resource: AbilityResource

@onready var audio_player = $AudioStreamPlayer

func _physics_process(delta):
	const SPEED = 200
	const RANGE = 400
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta # makes it time dependent instead of pixel dependent
	travelled_distance += SPEED * delta

	$AnimationPlayer.play("base")
	
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	#audio_player.play()
	if body.has_method("take_damage"):
		body.take_damage(resource.base_damage)
	queue_free()




