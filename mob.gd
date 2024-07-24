extends CharacterBody2D

signal killed_mob(mob_resource)

@export var resource: Resource
@export var health : int
@onready var player = get_node("/root/Game/TileMap/Player")
@onready var monster = %Monster 
@onready var freeze_timer = $FreezeTimer
@onready var audio_player = $AudioStreamPlayer
var is_freezed = false
var is_dead = false
func _ready():
	health = resource.health
	monster.get_node("Monster").texture = resource.texture


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position) 
	velocity = direction * 50.0
	if !is_freezed:
		move_and_slide()
		%Monster.play_walk_animation(direction)


func take_damage(damage):
	health -= damage
	%Monster.play_hurt_animation()
	if is_dead:
		return
	if health <= 0:
		is_dead = true
		audio_player.play()
		monster.hide()
		get_tree().call_group("Player","killed_mob",resource)
		
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		
		await audio_player.finished
		queue_free()

func freeze():
	is_freezed = true
	freeze_timer.start()

func _on_freeze_timer_timeout():
	is_freezed = false
