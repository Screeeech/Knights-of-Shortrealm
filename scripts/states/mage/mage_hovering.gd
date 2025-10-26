extends State

@export var inactive_state: State
@export var flying_state: State
@export var attacking_state: State
@export var escaping_state: State
@export var exploofing_state: State

func enter() -> void:
    super()

func exit() -> void:
    pass

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    return null
