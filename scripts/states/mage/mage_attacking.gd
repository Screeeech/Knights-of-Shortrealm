extends State

@export var inactive_state: State
@export var flying_state: State
@export var hovering_state: State
@export var escaping_state: State
@export var exploofing_state: State

var animation_finished: bool = false
var timer := Timer.new()

func _ready() -> void:
    add_child(timer)
    timer.timeout.connect(_on_animation_finished)

func enter() -> void:
    super()
    animation_finished = false
    timer.call_deferred("start", 1)

func exit() -> void:
    pass

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    if parent.killed:
        return exploofing_state

    if animation_finished:
        return hovering_state

    return null

func _on_animation_finished() -> void:
    if animation_finished:
        return

    parent.fireball.activate()
    animation_finished = true
