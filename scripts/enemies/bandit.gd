class_name Bandit
extends Node2D

@export var knight: Knight
@export var speed: float = 200
@export var escape_speed: float = 300
@export var hit_distance: float = 50
@export var escape_vector: Vector2

@onready var killed: bool = false
@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var shadow_sprite: Sprite2D = $ShadowSprite
@onready var state_machine: StateMachine = $StateMachine
@onready var animations: AnimationPlayer = $BanditAnimations
@onready var exploof: Exploof = $Exploof 

var faction := Helpers.Faction.ENEMY

func _ready() -> void:
    state_machine.init(self)

func _process(delta: float) -> void:
    state_machine.process_frame(delta)

func _unhandled_input(event: InputEvent) -> void:
    state_machine.process_input(event)

func _physics_process(delta: float) -> void:
    state_machine.process_physics(delta)

func take_damage() -> void:
    killed = true
