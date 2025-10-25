extends State

@export var start_menu_state: State
@export var idle_state: State
@export var walking_state: State
@export var jumping_state: State

var total_time: float

func enter() -> void:
    super()
    total_time = parent.jump_time / 2

func exit() -> void:
    pass

func process_input(_input: InputEvent) -> State:
    return null

func process_physics(delta: float) -> State:
    var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
    parent.velocity = input_direction * parent.speed * parent.jump_move_speed_mod
    if parent.velocity.x < 0:
        parent.character_sprite.flip_h = true
    elif parent.velocity.x > 0:
        parent.character_sprite.flip_h = false

    parent.move_and_slide()

    total_time += delta

    parent.jump_offset = Helpers.get_jump_height(total_time, parent.jump_time, parent.jump_height)

    var shadow_scale: float = parent.jump_offset * 0.002
    parent.shadow.scale = parent.start_shadow_scale + Vector2(shadow_scale, shadow_scale)
    
    if total_time >= parent.jump_time:
        parent.jump_offset = 0
        if input_direction:
            return walking_state
        return idle_state


    return null

func process_frame(_delta: float) -> State:
    return null
