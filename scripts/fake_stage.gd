extends Node

@onready var background: Parallax2D = $Background
@onready var backdrop: Parallax2D = $Backdrop
@onready var terrain: Parallax2D = $Terrain
@onready var foreground: Parallax2D = $foreground



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    SignalBus.start_button_pressed.connect(gamestarting)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

func gamestarting():
    background.hide()
    backdrop.hide()
    terrain.hide()
    foreground.hide()
    
