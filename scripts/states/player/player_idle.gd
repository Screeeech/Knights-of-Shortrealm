extends State

@export var walking_state: State

func enter() -> void:
    # Calls the enter() function of the parent State class
    # which initialises the animation
    super()

func process_input(_input: InputEvent) -> State:
    var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
    if input_direction:
        print(walking_state.animation_name)
        return walking_state

    return null

func process_frame(_delta: float) -> State:
    return null
