extends CharacterBody2D

@export var health: int
@export var damage: int
@export var speed: int

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var character_sprite: Sprite2D = $CharacterSprite

enum State {IDLE, WALKING}

@onready var state: State = State.IDLE

var temp_velocity = Vector2()
var x = position.x
var y = position.y
var oldx = position.x
var oldy = position.y


func _ready() -> void:
    pass

func _process(_delta: float) -> void:
    change_state()
    handle_animations()

func get_input(): 
    var direction: Vector2 = Input.get_vector("left", "right", "up", "down").normalized()
    velocity = direction * round(speed)

func _physics_process(_delta):
    oldx = position.x
    oldy = position.y
    get_input()
    move_and_slide()

    # # Smooth out diagonal movement
    # if velocity and not is_on_wall():
    #     if abs(oldx - position.x) > abs(oldy - position.y): 
    #         x = round(position.x)
    #         y = round(position.y + (x - position.x) * velocity.y / velocity.x)
    #         position.y = y
    #     elif abs(oldx - position.x) <= abs(oldy - position.y):
    #         y = round(position.y)
    #         x = round(position.x + (y - position.y) * velocity.x / velocity.y)
    #         position.x = x

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
    elif velocity.x > 0:
        character_sprite.flip_h = false
