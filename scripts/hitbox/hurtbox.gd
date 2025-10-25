class_name Hurtbox
extends Area2D

@onready var faction: Helpers.Faction = owner.faction

func _ready() -> void:
    monitoring = false

    set_collision_mask_value(2, false)
    set_collision_mask_value(3, false)
    match faction:
        Helpers.Faction.PLAYER:
            set_collision_layer_value(3, true)
        Helpers.Faction.ENEMY:
            set_collision_layer_value(2, true)
        _:
            pass

func receive_hit() -> void:
    owner.take_damage()
