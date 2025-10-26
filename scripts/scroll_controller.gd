extends Node2D

var speed : int = 10

# Called when the node enters the scene tree for the first time.

var direction = Vector2(-1,0)

@onready var background: Parallax2D = $".."
@onready var backdrop: Parallax2D = $"../../Backdrop"
@onready var terrain: Parallax2D = $"../../Terrain"
@onready var foreground: Parallax2D = $"../../foreground"
@onready var end: Parallax2D = $"../../End"

func _ready() -> void:
    SignalBus.knight_hit.connect(knighthit)
    SignalBus.attend.connect(knightup)


func _process(delta: float) -> void:
    backdrop.scroll_offset += direction * speed * delta
    terrain.scroll_offset += direction * speed * delta
    foreground.scroll_offset += direction * speed * delta
    background.scroll_offset += direction * speed * delta
    end.scroll_offset += direction * speed * delta

func knighthit():
    speed = 0
    
func knightup():
    speed = 10
