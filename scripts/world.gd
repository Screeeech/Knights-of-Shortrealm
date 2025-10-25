extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var camera: Camera2D = $Camera

@onready var camera_active: bool = false

@export var camera_speed: float = 50

func _on_tree_entered() -> void:
    SignalBus.start_scrolling.connect(pause_scrolling)
    SignalBus.start_scrolling.connect(start_scrolling)

#func _process(delta: float) -> void:
 #   if camera_active:
  #      camera.position.x += camera_speed * delta


func start_scrolling() -> void:
    camera_active = true

func pause_scrolling() -> void:
    camera_active = false
