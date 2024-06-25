extends Node2D


@onready var animation_tree = %AnimationTree
@onready var hit_animation_player = %HitFlashAnimationPlayer

func play_idle_animation(direction):
	animation_tree["parameters/conditions/idle"] = true
	animation_tree["parameters/conditions/is_walking"] = false


func play_walk_animation(direction):
	animation_tree["parameters/conditions/idle"] = false
	animation_tree["parameters/conditions/is_walking"] = true
	update_blend_position(direction)

func play_hurt_animation():
	hit_animation_player.play("hit_flash")

func update_blend_position(direction):
	animation_tree["parameters/idle/blend_position"] = direction
	animation_tree["parameters/walk/blend_position"] = direction
