class_name Player
extends CharacterBody2D

@export var speed: int = 500
@export var jump_height: float = 50
@export var jump_time: float = 0.5
@export var jump_move_speed_mod: float = 0.8
@export var hit_shape: Shape2D

@onready var jump_offset: float = 0

@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var sword_sprite: Sprite2D = $CharacterSprite/Items/SwordSprite
@onready var shield_sprite: Sprite2D = $CharacterSprite/Items/ShieldSprite
@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var sword_animations: AnimationPlayer = $AnimationPlayerSword
@onready var shadow: Sprite2D = $ShadowSprite
@onready var start_shadow_scale: Vector2 = $ShadowSprite.scale
@onready var state_machine: StateMachine = $StateMachine
@onready var sword_position: Node2D = $CharacterSprite/SwordPosition

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

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("sword"):
        hit_sword()

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
        sword_position.rotation = -1 * abs(sword_position.rotation)
        sword_position.position.x = -1 * abs(sword_position.position.x)
    elif velocity.x > 0:
        character_sprite.flip_h = false
        sword_sprite.scale.x = abs(sword_sprite.scale.x)
        shield_sprite.scale.x = abs(shield_sprite.scale.x)
        sword_position.rotation = abs(sword_position.rotation)
        sword_position.position.x = abs(sword_position.position.x)

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

func hit_sword() -> void:
    if not held_item == Items.SWORD:
        return

    var hitbox := Hitbox.new(Helpers.Faction.PLAYER, 1, hit_shape)
    sword_position.add_child(hitbox)

func block_shield() -> void:
    pass

func get_held_item() -> Items:
    return held_item
