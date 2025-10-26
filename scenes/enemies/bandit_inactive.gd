extends State

@export var walking_state: State
@export var exploofing_state: State
@export var escaping_state: State

func enter() -> void:
    super()
    parent.character_sprite.hide()
    parent.shadow_sprite.hide()

func exit() -> void:
    parent.character_sprite.show()
    parent.shadow_sprite.show()

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    if parent.active:
        return walking_state

    return null
