extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine
@onready var animations: AnimationPlayer = $AnimationPlayer
@onready var interact_area: InteractionArea = $GearInteraction
@onready var shield_sprite: Sprite2D = $Items/ShieldSprite
@onready var sword_sprite: Sprite2D = $Items/SwordSprite
@onready var faction: Helpers.Faction = Helpers.Faction.PLAYER

@export var player: Player
@export var stun_time: float


func _ready() -> void:
    state_machine.init(self)
    interact_area.interact = Callable(self, "_on_interact")
    SignalBus.draw_sword.connect(_on_weapon_draw)
    SignalBus.draw_shield.connect(_on_weapon_draw)


func _on_interact(interact_name: String) -> void:
    match interact_name:
        "sword":
            SignalBus.draw_sword.emit()
        "shield":
            SignalBus.draw_shield.emit()
        _:
            pass

func _on_weapon_draw():
    match player.get_held_item():
        player.Items.NONE:
            shield_sprite.visible = true
            sword_sprite.visible = true

        player.Items.SWORD:
            shield_sprite.visible = true
            sword_sprite.visible = false

        player.Items.SHIELD:
            shield_sprite.visible = false
            sword_sprite.visible = true

        _:
            pass

func take_damage() -> void:
    SignalBus.knight_hit.emit()
