class_name Player
extends CharacterBody2D

@export var speed: int = 500
@export var jump_height: float = 50
@export var jump_time: float = 0.5
@export var jump_move_speed_mod: float = 0.8

@onready var jump_offset: float = 0

@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var sword_sprite: Sprite2D = $CharacterSprite/SwordSprite
@onready var shield_sprite: Sprite2D = $CharacterSprite/ShieldSprite
@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var shadow: Sprite2D = $ShadowSprite
@onready var start_shadow_scale: Vector2 = $ShadowSprite.scale
@onready var state_machine: StateMachine = $StateMachine

enum Items
{
    NONE,
    SWORD,
    SHIELD
}
@onready var held_item: Items = Items.NONE

func _ready() -> void:
    state_machine.init(self)
    SignalBus.draw_sword.connect(_on_draw_sword)
    SignalBus.draw_shield.connect(_on_draw_shield)

func _process(delta: float) -> void:
    state_machine.process_frame(delta)
    character_sprite.position.y = jump_offset

func _unhandled_input(event: InputEvent) -> void:
    state_machine.process_input(event)

func _physics_process(delta: float) -> void:
    state_machine.process_physics(delta)

func flip_sprites() -> void:
    if velocity.x < 0:
        character_sprite.flip_h = true
        sword_sprite.scale.x = -1 * abs(sword_sprite.scale.x)
        shield_sprite.scale.x = -1 * abs(shield_sprite.scale.x)
    elif velocity.x > 0:
        character_sprite.flip_h = false
        sword_sprite.scale.x = abs(sword_sprite.scale.x)
        shield_sprite.scale.x = abs(shield_sprite.scale.x)

func _on_draw_sword() -> void:
    sword_sprite.visible = not sword_sprite.visible
    shield_sprite.visible = false

    if sword_sprite.visible:
        held_item = Items.SWORD
    else:
        held_item = Items.NONE

func _on_draw_shield() -> void:
    shield_sprite.visible = not shield_sprite.visible
    sword_sprite.visible = false

    if shield_sprite.visible:
        held_item = Items.SHIELD
    else:
        held_item = Items.NONE
