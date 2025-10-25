extends Node

@onready var menu_theme: AudioStreamPlayer2D = $MenuTheme
@onready var level_theme: AudioStreamPlayer2D = $LevelTheme

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    SignalBus.start_button_pressed.connect(startbuttonpress)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
    
func startbuttonpress():
    get_node("LevelTheme").play()
    get_node("MenuTheme").stop()
