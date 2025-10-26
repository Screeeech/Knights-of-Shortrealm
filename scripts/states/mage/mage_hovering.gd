extends State

@export var inactive_state: State
@export var flying_state: State
@export var attacking_state: State
@export var escaping_state: State
@export var exploofing_state: State

@onready var killed: bool = false

func enter() -> void:
    super()
    killed = false

func exit() -> void:
    pass

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    if parent.killed:
        return exploofing_state

    if parent.hit_knight:
        return escaping_state


    return null
