extends State

@export var walking_state: State
@export var start_menu: State

func enter() -> void:
    super()

func process_input(_input: InputEvent) -> State:
    return null

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    return null
