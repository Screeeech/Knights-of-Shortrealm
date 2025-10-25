extends State

@export var start_menu_state: State
@export var idle_state: State
@export var walking_state: State
@export var falling_state: State

func enter() -> void:
    super()

func exit() -> void:
    pass

func process_input(_input: InputEvent) -> State:
    return null

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    return null
