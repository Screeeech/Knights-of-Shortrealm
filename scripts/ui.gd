extends Control

@onready var start: Button = $start
@onready var squire: Label = $squire
@onready var attendme: Label = $attendme


var controls_pressed: bool = false

func _ready() -> void:

    get_tree().paused = true

func _process(_delta: float) -> void:
    pass


func _on_button_pressed() -> void:
    SignalBus.start_button_pressed.emit()
    SignalBus.start_scrolling.emit()

    self.queue_free()
    # Add gamestate here

func _on_button_controls_pressed() -> void:
    pass

func _on_button_credits_pressed() -> void:
    pass 
    


func _on_exit_button_pressed() -> void:
    get_tree().quit()
