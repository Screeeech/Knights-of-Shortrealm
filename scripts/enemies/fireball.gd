class_name Fireball
extends Node2D

@export var hit_distance: float = 50
@export var speed: float = 400
@export var mage: Mage

@onready var exploof: Exploof = $Exploof
@onready var hitbox: Area2D = $Hitbox
@onready var sprite: Sprite2D = $FireballSprite

var hit: bool = false
var flipped: bool = false
var target: Vector2
var active: bool = false
var direction: Vector2 
var scuffed_position: Vector2

var faction: Helpers.Faction = Helpers.Faction.ENEMY

func _ready() -> void:
    self.hide()
    target = mage.knight.global_position + Vector2(0,-200)

func _process(delta: float) -> void:
    if not active or hit:
        return 

    if flipped:
        var mage_pos: Vector2 = mage.hurtbox.global_position
        position += direction * speed * delta
        scuffed_position += direction * speed * delta
        var distance: float = scuffed_position.length()
        print(distance)
        if distance <= 50:
            mage.take_damage()
    else:
        var distance: float = abs((target - global_position).length())
        position += direction * speed * delta
        scuffed_position += direction * speed * delta


        if distance <= hit_distance:
            hit = true
            mage.knight.take_damage()
            sprite.hide()
            exploof.exploof()

func take_damage() -> void:
    if flipped:
        return

    direction *= -1
    hitbox.set_collision_mask_value(3, true) 
    sprite.flip_h = true
    flipped = true

func activate() -> void:
    direction = (target - global_position).normalized()
    active = true
    self.show()
