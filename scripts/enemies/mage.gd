extends Node2D

@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var shadow_sprite: Sprite2D = $ShadowSprite
@onready var state_machine: StateMachine = $StateMachine
@onready var animations: AnimationPlayer = $MageAnimations
@onready var exploof: Exploof = $Exploof

var killed: bool = false
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
