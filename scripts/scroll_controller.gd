extends Node2D

const SPEED : int = 10

# Called when the node enters the scene tree for the first time.

var direction = Vector2(-1,0)

@onready var backdrop: Parallax2D = $".."
@onready var terrain: Parallax2D = $"../../Terrain"
@onready var props: Parallax2D = $"../../Props"
@onready var foreground: Parallax2D = $"../../foreground"



func _process(delta: float) -> void:
    backdrop.scroll_offset += direction * SPEED * delta
    terrain.scroll_offset += direction * SPEED * delta
    props.scroll_offset += direction * SPEED * delta
    foreground.scroll_offset += direction * SPEED * delta
