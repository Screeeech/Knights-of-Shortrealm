class_name Mage
extends Node2D

@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var shadow_sprite: Sprite2D = $ShadowSprite
@onready var state_machine: StateMachine = $StateMachine
@onready var animations: AnimationPlayer = $MageAnimations
@onready var exploof: Exploof = $Exploof
@onready var fireball: Fireball = $Fireball
@onready var hurtbox: Hurtbox = $CharacterSprite/Hurtbox
@onready var hit_knight: bool = false

@export var attack_distance: float = 500
@export var knight: Knight
@export var speed: float = 150
@export var escape_speed: float = 250
@export var escape_vector: Vector2
@export var fire_ball_offset: Vector2

var killed: bool = false
var faction := Helpers.Faction.ENEMY

func _ready() -> void:
    state_machine.init(self)
    SignalBus.kill_mage.connect(take_damage)
    SignalBus.mage_hit.connect(start_fleeing)
    hurtbox.set_collision_layer_value(4, false)
    hurtbox.set_collision_layer_value(2, false)

func _process(delta: float) -> void:
    state_machine.process_frame(delta)

func _unhandled_input(event: InputEvent) -> void:
    state_machine.process_input(event)

func _physics_process(delta: float) -> void:
    state_machine.process_physics(delta)

func take_damage() -> void:
    killed = true

func start_fleeing(caller: Node2D) -> void:
    if caller == fireball:
        hit_knight = true
