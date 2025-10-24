extends Control

@onready var start: Button = $start
@onready var controls: Button = $controls
@onready var credits: Button = $credits
@onready var squire: Label = $squire
@onready var attendme: Label = $attendme

var controls_pressed: bool = false
var credits_pressed: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass



	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	start.queue_free()
	controls.queue_free()
	credits.queue_free()
	squire.queue_free()
	attendme.queue_free()
	#add gamestate here


func _on_button_controls_pressed() -> void:
	pass



func _on_button_credits_pressed() -> void:
	pass # Replace with function body.
	
func _control_button():
	if (controls_pressed == false):
		pass
	else:
		pass
