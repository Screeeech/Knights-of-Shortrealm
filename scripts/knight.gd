class_name Knight
extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var interact_area: InteractionArea = $GearInteraction
@onready var attend_area: InteractionArea = $AttendInteraction
@onready var shield_sprite: Sprite2D = $Items/ShieldSprite
@onready var sword_sprite: Sprite2D = $Items/SwordSprite
@onready var faction: Helpers.Faction = Helpers.Faction.PLAYER

@export var player: Player

func _ready() -> void:
    state_machine.init(self)
    interact_area.interact = Callable(self, "_on_interact")
    attend_area.interact = Callable(self, "_on_attend")
    SignalBus.reached_end.connect(gameended)


func _process(delta: float) -> void:
    state_machine.process_frame(delta)

func _input(event: InputEvent) -> void:
    state_machine.process_input(event)

func _physics_process(delta: float) -> void:
    state_machine.process_physics(delta)

func take_damage() -> void:
    SignalBus.knight_hit.emit()

func _on_interact(interact_name: String) -> void:
    match interact_name:
        "sword":
            SignalBus.draw_sword.emit()
        "shield":
            SignalBus.draw_shield.emit()
        _:
            pass

func _on_attend(interact_name: String) -> void:
    if interact_name == "interact":
        SignalBus.attend.emit()
        
func gameended():
    queue_free()
