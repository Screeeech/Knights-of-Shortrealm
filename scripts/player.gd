class_name Player
extends CharacterBody2D

@export var health: int
@export var damage: int
@export var speed: int

@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var character_sprite: Sprite2D = $CharacterSprite

@onready var state_machine: StateMachine = $StateMachine

func _ready() -> void:
    state_machine.init(self)

func _draw() -> void:
    draw_rect(Rect2(-10,-50,20,50), Color.RED)
    draw_circle(Vector2(), 5, Color.BLUE)

func _process(delta: float) -> void:
    queue_redraw()
    state_machine.process_frame(delta)
    # print("Character script: " + str(Input.get_vector("left", "right", "up", "down")))

func _unhandled_input(event: InputEvent) -> void:
    state_machine.process_input(event)

func _physics_process(delta: float):
    state_machine.process_physics(delta)
