extends State

@export var walking_state: State
@export var idle_state: State

var start_pressed: bool = false

func _on_tree_entered() -> void:
    SignalBus.start_button_pressed.connect(on_start_pressed)

func enter() -> void:
    super()

func process_input(_input: InputEvent) -> State:
    return null

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    if start_pressed:
        return idle_state

    return null

func on_start_pressed() -> void:
    print("Start pressed")
    start_pressed = true

