extends State

@export var walking_state: State
var stunned_done: bool = false


func enter() -> void:
    super()
    SignalBus.pause_scrolling.emit()
    stunned_done = false
    var timer := Timer.new()
    add_child(timer)
    timer.timeout.connect(queue_free)
    timer.call_deferred("start", parent.stun_time)

func process_input(_input: InputEvent) -> State:
    return null

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    return null
