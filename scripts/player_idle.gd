extends State
class_name Player_Idle

@export var lerp_amount := 0.25
@export var player : Player

func update(_delta: float) -> void:
	if player.has_direction():
		transition.emit(self, "move")
