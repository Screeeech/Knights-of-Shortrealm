extends State

@export var inactive_state: State
@export var hovering_state: State
@export var attacking_state: State
@export var escaping_state: State
@export var exploofing_state: State

func enter() -> void:
    super()

func exit() -> void:
    pass

func process_physics(delta: float) -> State:
    var target_position: Vector2 = parent.knight.global_position
    var fly_direction: Vector2 = (target_position - parent.global_position).normalized()

    parent.global_position += fly_direction * parent.speed * delta

    return null

func process_frame(_delta: float) -> State:
    var target_position: Vector2 = parent.knight.global_position
    var distance: float = (target_position - parent.global_position).length()

    if distance <= parent.attack_distance:
        return attacking_state

    return null
