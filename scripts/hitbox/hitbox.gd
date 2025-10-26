class_name Hitbox
extends Area2D

var faction: Helpers.Faction
var lifetime: float
var shape: Shape2D

func _init(_faction: Helpers.Faction, _lifetime: float, _shape: Shape2D) -> void:
    lifetime = _lifetime
    shape = _shape

func _ready() -> void:
    monitorable = false
    area_entered.connect(_on_area_entered)

    if lifetime > 0.0:
        var new_timer := Timer.new()
        add_child(new_timer)
        new_timer.timeout.connect(queue_free)
        new_timer.call_deferred("start", lifetime)

    if shape:
        var collision_shape := CollisionShape2D.new()
        collision_shape.shape = shape
        add_child(collision_shape)


    set_collision_layer_value(1, false)
    set_collision_mask_value(1, false)

    set_collision_layer_value(2, false)
    set_collision_layer_value(3, false)
    match faction:
        Helpers.Faction.PLAYER:
            set_collision_mask_value(3, true)
        Helpers.Faction.ENEMY:
            set_collision_mask_value(2, true)
        _:
            pass

func _on_area_entered(area: Area2D) -> void:
    if not area.has_method("receive_hit"):
        return

    area.receive_hit()
