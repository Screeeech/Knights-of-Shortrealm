extends State

@export var idle_state: State

func enter() -> void:
    # Calls the enter() function of the parent State class
    # which initialises the animation
    super()

func process_input(_input: InputEvent) -> State:
    return null

func process_physics(_delta: float) -> State:
    var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
    if not input_direction:
        return idle_state

    parent.velocity = input_direction * parent.speed

    parent.move_and_slide()

    if parent.velocity.x < 0:
        parent.character_sprite.flip_h = true
    elif parent.velocity.x > 0:
        parent.character_sprite.flip_h = false

    return null

func process_frame(delta: float) -> State:
    return null
