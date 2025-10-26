class_name Player
extends CharacterBody2D

@export var speed: int = 500
@export var jump_height: float = 50
@export var jump_time: float = 0.5
@export var jump_move_speed_mod: float = 0.8
@export var shield_block_time: float = 0.4
@export var hit_shape: Shape2D
@export var block_shape: Shape2D


@onready var jump_offset: float = 0

@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var sword_sprite: Sprite2D = $CharacterSprite/Items/SwordSprite
@onready var shield_sprite: Sprite2D = $CharacterSprite/Items/ShieldSprite
@onready var shield_block_sprite: Sprite2D = $CharacterSprite/Items/ShieldBlockSprite
@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var sword_animations: AnimationPlayer = $AnimationPlayerSword
@onready var shadow: Sprite2D = $ShadowSprite
@onready var start_shadow_scale: Vector2 = $ShadowSprite.scale
@onready var state_machine: StateMachine = $StateMachine
@onready var sword_position: Node2D = $CharacterSprite/SwordPosition
@onready var shield_position: Node2D = $CharacterSprite/ShieldPosition
@onready var pickup_item: AudioStreamPlayer2D = $Sound/PickupItem



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
    SignalBus.reached_end.connect(gameended)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("sword"):
        hit_sword()
    if event.is_action_pressed("shield"):
        block_shield()

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
        shield_block_sprite.scale.x = -1 * abs(shield_block_sprite.scale.x)
        shield_position.rotation = -1 * abs(shield_position.rotation)
        shield_position.position.x = -1 * abs(shield_position.position.x)
        sword_position.rotation = -1 * abs(sword_position.rotation)
        sword_position.position.x = -1 * abs(sword_position.position.x)
    elif velocity.x > 0:
        character_sprite.flip_h = false
        sword_sprite.scale.x = abs(sword_sprite.scale.x)
        shield_sprite.scale.x = abs(shield_sprite.scale.x)
        shield_block_sprite.scale.x = abs(shield_block_sprite.scale.x)
        shield_position.rotation = abs(shield_position.rotation)
        shield_position.position.x = abs(shield_position.position.x)
        sword_position.rotation = abs(sword_position.rotation)
        sword_position.position.x = abs(sword_position.position.x)

func _on_draw_sword() -> void:
    pickup_item.play()
    sword_sprite.visible = not sword_sprite.visible
    shield_sprite.visible = false
    

    if sword_sprite.visible:
        held_item = Items.SWORD
    else:
        held_item = Items.NONE

func _on_draw_shield() -> void:
    pickup_item.play()
    if shield_sprite.visible or shield_block_sprite.visible:

        shield_sprite.visible = false
        shield_block_sprite.visible = false

        sword_sprite.visible = false

        held_item = Items.NONE
    else:

        shield_sprite.visible = true

        sword_sprite.visible = false

        held_item = Items.SHIELD



func hit_sword() -> void:
    if not held_item == Items.SWORD or sword_animations.is_playing():
        return

    var hitbox := Hitbox.new(Helpers.Faction.ENEMY, 1, hit_shape)
    sword_position.add_child(hitbox)
    sword_animations.play("attack")

func block_shield() -> void:
    if not held_item == Items.SHIELD:
        return

    shield_sprite.hide()
    shield_block_sprite.show()


    var timer := Timer.new()
    add_child(timer)
    var timer_stop = func(): 
        shield_sprite.show()
        shield_block_sprite.hide()
        timer.queue_free()
    pass
    timer.timeout.connect(timer_stop)
    timer.call_deferred("start", shield_block_time)

    var hitbox := Hitbox.new(Helpers.Faction.SHIELD, shield_block_time, block_shape)
    shield_position.add_child(hitbox)

func get_held_item() -> Items:
    return held_item
    
func gameended():
    queue_free()
