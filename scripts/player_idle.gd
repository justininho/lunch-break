extends State
class_name Player_Idle

@export var lerp_amount := 0.25
@export var player : Player

func update(_delta: float) -> void:
	if player.has_direction():
		transition.emit(self, "move")

#func physics_update(delta: float) -> void:
	#player.velocity.x = lerp(player.velocity.x, 0.0, lerp_amount)
	#animation_tree["parameters/StateMachine/idle/blend_position"] = veloc
	#player.move_and_slide()
