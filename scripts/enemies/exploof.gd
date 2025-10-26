class_name Exploof
extends Node2D

@onready var sprite: Sprite2D = $ExploofSprite
@onready var animation: AnimationPlayer = $ExploofAnimation
@onready var alive: bool = true

func _ready() -> void:
    pass

func exploof() -> void:
    sprite.show()
    animation.play("exploof")
    alive = false

func _process(_delta: float) -> void:
    if not alive and not animation.is_playing():
        get_parent().queue_free()
