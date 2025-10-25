class_name StateMachine
extends Node

@export var starting_state: State

var current_state: State

# Initializes the state machine by passing 
# the character it controls to each child state node
func init(parent: Player) -> void:
    for child in get_children():
        child.parent = parent

    change_state(starting_state)

func change_state(new_state: State) -> void:
    if current_state:
        current_state.exit()

    current_state = new_state
    current_state.enter()

func _process(_delta: float) -> void:
    # print(current_state)
    pass

func process_input(input: InputEvent) -> void:
    var new_state: State = current_state.process_input(input)
    if new_state != null:
        change_state(new_state)

func process_physics(delta: float) -> void:
    var new_state: State = current_state.process_physics(delta)
    if new_state != null:
        change_state(new_state)

func process_frame(delta: float) -> void:
    var new_state: State = current_state.process_frame(delta)
    if new_state != null:
        change_state(new_state)
