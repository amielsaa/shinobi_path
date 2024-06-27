extends Resource
class_name AbilityResource

enum AbilityType {PROJECTILE, SPAWN, CIRCULAR}

@export var ability_type: AbilityType
@export var ability_scene: PackedScene
@export var base_damage: int
