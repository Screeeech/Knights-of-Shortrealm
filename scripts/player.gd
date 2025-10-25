class_name Player
extends CharacterBody2D

@export var speed: int = 500
@export var jump_height: float = 50
@export var jump_time: float = 0.5
@export var jump_move_speed_mod: float = 0.8

@onready var jump_offset: float = 0

@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var shadow: Sprite2D = $ShadowSprite
@onready var character_sprite: Sprite2D = $CharacterSprite
@onready var state_machine: StateMachine = $StateMachine

@onready var start_shadow_scale: Vector2 = $ShadowSprite.scale


func _ready() -> void:
    state_machine.init(self)

func _draw() -> void:
    var pos: Vector2 = character_sprite.position
    var width: float = 20
    var height: float = 50

    draw_rect(Rect2(pos.x - (width / 2), pos.y - height, width, height), Color.RED)
    draw_circle(Vector2(pos.x, jump_offset), 5, Color.BLUE)

func _process(delta: float) -> void:
    state_machine.process_frame(delta)
    character_sprite.position.y = jump_offset
    
    queue_redraw()

func _unhandled_input(event: InputEvent) -> void:
    state_machine.process_input(event)

func _physics_process(delta: float):
    state_machine.process_physics(delta)
