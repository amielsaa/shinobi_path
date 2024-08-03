extends StaticBody2D
class_name Spawner

enum ELEMENT_TYPE {ICE, FIRE, METAL}
enum MOB_TYPE_ZONE {MONSTER, BOSS}

@export var type: ELEMENT_TYPE
@export var resource: HitableResourceBase
@onready var hit_animation_player = $HitAnimationPlayer
@onready var health_bar = $ProgressBar
var health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	health = resource.health
	health_bar.max_value = resource.health
	for area_zone in get_children():
		if area_zone is Area2D:
			area_zone.type = type


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_hurt_animation():
	hit_animation_player.play("hit_flash")

func take_damage(damage):
	health -= damage
	health_bar.value = health

	play_hurt_animation()
	if health <= 0:
		#audio_player.play()
		get_tree().current_scene.spawn_destroyed(type)
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
		#await audio_player.finished

		queue_free()
