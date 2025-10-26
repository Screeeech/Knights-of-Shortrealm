extends Control

func _ready():
    SignalBus.game_over.connect(_on_game_over_called)

func _on_game_over_called():
    show()

func _on_button_pressed() -> void:
    get_tree().reload_current_scene()
