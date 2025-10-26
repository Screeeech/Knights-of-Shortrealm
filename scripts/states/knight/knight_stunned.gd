extends State

@export var walking_state: State
@export var attend_interaction: InteractionArea
@export var gear_interaction: InteractionArea

var stunned_done: bool = false

func _ready() -> void:
    SignalBus.attend.connect(_on_attend)

func enter() -> void:
    super()
    print("Knight entered stunend state")
    SignalBus.pause_scrolling.emit()
    stunned_done = false
    attend_interaction.monitoring = true
    gear_interaction.monitoring = false

func exit() -> void:
    attend_interaction.monitoring = false
    gear_interaction.monitoring = true

func process_input(_input: InputEvent) -> State:
    return null

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    if stunned_done:
        print("back to walking!!")
        return walking_state

    return null

func _on_attend():
    stunned_done = true
