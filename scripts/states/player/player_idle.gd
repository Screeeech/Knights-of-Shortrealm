extends State

@export var walking_state: State

func enter() -> void:
    # Calls the enter() function of the parent State class
    # which initialises the animation
    super()

func process_input(_input: InputEvent) -> State:
    return null

func process_frame(_delta: float) -> State:
    return null
