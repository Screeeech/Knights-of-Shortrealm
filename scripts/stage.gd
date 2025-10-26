extends Node2D

@onready var victory: Control = $Victory



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    victory.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass



func _on_area_2d_body_entered(body: Node2D) -> void:
    victory.show()
    SignalBus.reached_end.emit()
