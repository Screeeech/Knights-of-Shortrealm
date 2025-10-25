extends State

@export var start_menu_state: State
@export var idle_state: State
@export var walking_state: State
@export var falling_state: State

var total_time: float = 0

func enter() -> void:
    super()
    total_time = 0

func exit() -> void:
    pass

func process_input(_input: InputEvent) -> State:
    return null

func process_physics(delta: float) -> State:
    var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
    parent.velocity = input_direction * parent.speed * parent.jump_move_speed_mod
    parent.move_and_slide()

    total_time += delta

    parent.jump_offset = Helpers.get_jump_height(total_time, parent.jump_time, parent.jump_height)
    # print(parent.jump_offset)

    if total_time >= (parent.jump_time / 2):
        return falling_state

    return null


func process_frame(_delta: float) -> State:
    return null
