extends Node2D

@onready var animation_tree = %AnimationTree

func play_idle_animation(direction):
	animation_tree["parameters/conditions/idle"] = true
	animation_tree["parameters/conditions/is_walking"] = false


func play_walk_animation(direction):
	animation_tree["parameters/conditions/idle"] = false
	animation_tree["parameters/conditions/is_walking"] = true
	update_blend_position(direction)

func update_blend_position(direction):
	animation_tree["parameters/idle/blend_position"] = direction
	animation_tree["parameters/walk/blend_position"] = direction

func play_hit_animation():
	$HitAnimationPlayer.play("hit_flash")

func play_disable_hit():
	await $HitAnimationPlayer.animation_finished
	$HitAnimationPlayer.play("disable_hit")
