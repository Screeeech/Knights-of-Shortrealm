class_name InteractionArea
extends Area2D

@export var interact_text: String
@export var interact_actions: Array[String]
@export var label_offset: Vector2

var interact: Callable = func():
    pass

func _on_body_entered(body: Node2D) -> void:
    if body.is_in_group("player"):
        InteractionManager.register_area(self)

func _on_body_exited(body: Node2D) -> void:
    if body.is_in_group("player"):
        InteractionManager.deregister_area(self)
