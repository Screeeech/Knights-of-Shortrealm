extends Node

func get_jump_height(elapsed_time: float, jump_time: float, jump_height: float) -> float:
    var gravity: float = (4 * jump_height) / (jump_time * jump_time)
    var height: float = -gravity * ((elapsed_time - jump_time/2) * (elapsed_time - jump_time/2)) + jump_height
    return -height
