extends State

@export var start_menu: State
@export var idle_state: State
@export var jumping_state: State
@export var falling_state: State

func enter() -> void:
    # Calls the enter() function of the parent State class
    # which initialises the animation
    super()

func process_input(input: InputEvent) -> State:
    var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
    if not input_direction:
        return idle_state

    if input.is_action("jump"):
        return jumping_state

    return null

func process_physics(_delta: float) -> State:
    var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
    parent.velocity = input_direction * parent.speed
    parent.move_and_slide()

    if parent.velocity.x < 0:
        parent.character_sprite.flip_h = true
    elif parent.velocity.x > 0:
        parent.character_sprite.flip_h = false

    return null

func process_frame(_delta: float) -> State:
    return null
