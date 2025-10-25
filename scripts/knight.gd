extends CharacterBody2D
@onready var state_machine: StateMachine = $StateMachine
@onready var animations: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
    state_machine.init(self)
