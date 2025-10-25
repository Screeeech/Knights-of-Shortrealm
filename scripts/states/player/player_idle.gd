extends State

@export var walking_state: State
@export var start_menu: State

func enter() -> void:
    super()

func process_input(_input: InputEvent) -> State:
    var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
    if input_direction:
        return walking_state

    return null

func process_frame(_delta: float) -> State:
    return null
