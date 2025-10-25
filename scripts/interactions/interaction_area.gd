class_name InteractionArea
extends Area2D

@export var action_name: String

@export var interact_actions: Array[String]

var interact: Callable = func():
    pass



func _on_body_exited(body: Node2D) -> void:
    if body.is_in_group("player"):
        InteractionManager.register_area(self)

func _on_body_entered(body: Node2D) -> void:
    if body.is_in_group("player"):
        InteractionManager.register_area(self)

