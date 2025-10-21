extends CharacterBody2D

@export var health: int
@export var damage: int
@export var speed: int

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var character_sprite: Sprite2D = $CharacterSprite

enum State {IDLE, WALKING}

@onready var state: State = State.IDLE

func _ready() -> void:
    pass

func _process(_delta: float) -> void:
    move()
    change_state()
    handle_animations()

func move() -> void:
    var direction: Vector2 = Input.get_vector("left", "right", "up", "down").normalized()
    velocity = direction * speed
    move_and_slide()

func change_state() -> void:
    if velocity.length() == 0:
        state = State.IDLE
    else:
        state = State.WALKING

func handle_animations() -> void:
    match state:
        State.IDLE:
            animation_player.play("idle")
        State.WALKING:
            animation_player.play("walking")

    if velocity.x < 0:
        character_sprite.flip_h = true
    else:
        character_sprite.flip_h = false
