extends State

@export var stunned_state: State

var hit: bool = false

func enter() -> void:
    super()
    hit = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    SignalBus.knight_hit.connect(_on_knight_hit)
    SignalBus.draw_sword.connect(_on_weapon_draw) 
    SignalBus.draw_shield.connect(_on_weapon_draw)


func process_input(_input: InputEvent) -> State:
    return null

func process_physics(_delta: float) -> State:
    return null

func process_frame(_delta: float) -> State:
    print("Walking")
    if hit:
        print("Knight stunned")
        return stunned_state

    return null

func _on_knight_hit() -> void:
    if hit:
        return

    print("HIT!")
    hit = true


func _on_weapon_draw():
    if hit:
        return

    match parent.player.get_held_item():
        parent.player.Items.NONE:
            parent.shield_sprite.visible = true
            parent.sword_sprite.visible = true

        parent.player.Items.SWORD:
            parent.shield_sprite.visible = true
            parent.sword_sprite.visible = false

        parent.player.Items.SHIELD:
            parent.shield_sprite.visible = false
            parent.sword_sprite.visible = true

        _:
            pass

