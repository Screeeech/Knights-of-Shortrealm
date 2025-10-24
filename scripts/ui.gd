extends Control

@onready var start: Button = $start
@onready var squire: Label = $squire
@onready var attendme: Label = $attendme

var controls_pressed: bool = false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	start.queue_free()
	squire.queue_free()
	attendme.queue_free()
	# Add gamestate here

func _on_button_controls_pressed() -> void:
	pass

func _on_button_credits_pressed() -> void:
	pass 
