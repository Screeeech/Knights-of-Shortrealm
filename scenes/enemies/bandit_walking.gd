extends State

@export var inactive_state: State
@export var exploofing_state: State
@export var escaping_state: State

func enter() -> void:
    super()

func exit() -> void:
    pass

func process_physics(delta: float) -> State:
    var target_position: Vector2 = parent.knight.global_position
    var walk_direction: Vector2 = (target_position - parent.global_position).normalized()

    parent.global_position += walk_direction * parent.speed * delta

    return null

func process_frame(_delta: float) -> State:
    var target_position: Vector2 = parent.knight.global_position
    var distance: float = (target_position - parent.global_position).length()

    if distance <= parent.hit_distance:
        parent.knight.take_damage()
        return escaping_state

    if parent.killed:
        return exploofing_state

    return null
