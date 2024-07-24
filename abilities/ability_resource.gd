extends Resource
class_name AbilityResource

enum AbilityType {PROJECTILE, SPAWN, CIRCULAR}

@export var ability_type: AbilityType
@export var ability_scene: PackedScene
@export var base_damage: int
@export var quantity: int
@export var ability_name: String
@export var element_type: Spawner.ELEMENT_TYPE
