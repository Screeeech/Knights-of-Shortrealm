extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var interact_area: InteractionArea = $InteractionArea

func _ready() -> void:
    state_machine.init(self)
    interact_area.interact = Callable(self, "_on_interact")
    SignalBus.draw_sword.connect(_on_sword_draw)
    SignalBus.draw_shield.connect(_on_shield_draw)


func _on_interact(interact_name: String) -> void:
    match interact_name:
        "sword":
            SignalBus.draw_sword.emit()
        "shield":
            SignalBus.draw_shield.emit()
        _:
            pass

func _on_sword_draw():
    print("DRAW THY SWORD DEAR SQUIRE")

func _on_shield_draw():
    print("ADDORN YOUR SHIELD SO YOU MAY BE PROTECTED")
