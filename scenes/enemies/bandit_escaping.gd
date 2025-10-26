extends State

@export var inactive_state: State
@export var walking_state: State
@export var exploofing_state: State



func enter() -> void:
    super()

func exit() -> void:
    pass

func process_physics(delta: float) -> State:
    if parent.escape_vector.x <= 0:
        parent.character_sprite.flip_h = true
    else:
        parent.character_sprite.flip_h = false

    parent.position += parent.escape_vector.normalized() * parent.escape_speed * delta


    return null

func process_frame(_delta: float) -> State:
    if parent.killed:
        return exploofing_state

    return null
