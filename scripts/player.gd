extends CharacterBody2D

@export var health: int
@export var damage: int
@export var speed: int

@onready var animation_player: AnimationPlayer = $AnimationPlayer

enum PlayerState {IDLE, WALKING}

@onready var state: PlayerState = PlayerState.IDLE

func _ready() -> void:
    pass

func _process(_delta: float) -> void:
    move()
    change_state()
    handle_animations()

func move() -> void:
    var direction: Vector2 = Input.get_vector("left", "right", "down", "up").normalized()
    velocity = direction * speed
    move_and_slide()

func change_state() -> void:
    if velocity.length() == 0:
        state = PlayerState.IDLE
    else:
        state = PlayerState.WALKING

func handle_animations() -> void:
    match state:
        PlayerState.IDLE:
            animation_player.play("idle")
        PlayerState.WALKING:
            animation_player.play("walking")
