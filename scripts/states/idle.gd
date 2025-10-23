extends State

@export var walking_state: State

func enter() -> void:
    # Calls the enter() function of the parent State class
    # which initialises the animation
    super()
    print("Entered idle state")

func process_input(_input: InputEvent) -> State:
    return null

func process_frame(_delta: float) -> State:
    var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
    if input_direction.length() > 0:
        return walking_state

    return null
