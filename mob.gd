extends CharacterBody2D

signal killed_mob(mob_resource)

@export var resource: Resource
@export var health : int
@onready var player = get_node("/root/Game/TileMap/Player")
@onready var monster = %Monster 


func _ready():
	health = resource.health
	monster.get_node("Monster").texture = resource.texture


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position) 
	velocity = direction * 50.0
	move_and_slide()
	%Monster.play_walk_animation(direction)


func take_damage():
	health -= 1
	%Monster.play_hurt_animation()
	
	if health == 0:
		get_tree().call_group("Player","killed_mob",resource)
		
		queue_free()
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
