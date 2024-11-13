extends State
class_name Player_Move

#@export var speed = 200.0
#@export var acceleration := 1200.0
@export var player : Player

func update(_delta: float) -> void:
	if !player.has_direction():
		transition.emit(self, "idle")
	
func physics_update(delta: float) -> void:
	if player.has_direction():
		player.move(delta)
