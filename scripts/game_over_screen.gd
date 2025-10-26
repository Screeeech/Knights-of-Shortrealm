extends Control

@onready var game_over: Label = $GameOver
@onready var text: Label = $Text
@onready var restart: Button = $Restart
@onready var scroll: TextureRect = $Scroll



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    game_over.hide()
    text.hide()
    restart.hide()
    scroll.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
     pass

func _input(ev):
    if Input.is_key_pressed(KEY_CTRL):
        game_over.show()
        text.show()
        restart.show()
        scroll.show()
        


func _on_button_pressed() -> void:
    get_tree().change_scene_to_file("res://world.tscn")
