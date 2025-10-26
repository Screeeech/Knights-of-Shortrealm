extends State

@export var stunned_state: State

var hit: bool = false

func enter() -> void:
    super()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    SignalBus.knight_hit.connect(_on_knight_hit)


func process_input(_input: InputEvent) -> State:
    return null

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    if hit:
        hit = false
        return stunned_state

    return null

func _on_knight_hit() -> void:
    hit = true
