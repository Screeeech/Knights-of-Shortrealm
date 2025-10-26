extends State

@export var inactive_state: State
@export var walking_state: State
@export var escaping_state: State

func enter() -> void:
    super()

func exit() -> void:
    pass

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    return null
