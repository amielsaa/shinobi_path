extends Area2D

@export var resource: AbilityResource

@onready var audio_player = $AudioStreamPlayer

func _on_body_entered(body):
	#audio_player.play()
	if body.has_method("take_damage") and body.has_method("freeze"):
		body.freeze()
		body.take_damage(resource.base_damage)


func _on_timer_timeout():
	#if is_instance_valid(get_node(".")):
		#queue_free()
	pass


func _on_animated_sprite_2d_animation_finished():
	queue_free()
