extends Resource

class_name MobResourceBase

enum MobType {MONSTER, BOSS}

@export var texture : Texture
@export var health : int
@export var speed: int
@export var damage : int
@export var type: MobType
