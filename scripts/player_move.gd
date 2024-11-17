extends State
class_name Player_Move

@export var player : Player
@onready var animation_tree: AnimationTree = %AnimationTree

func update(_delta: float) -> void:
	if !player.has_direction():
		transition.emit(self, "idle")
	
func physics_update(delta: float) -> void:
	if player.has_direction():
		move(delta)
	
func move(delta: float) -> void:
	var direction : Vector2 = player.get_direction()
	
	## Normalize direction to prevent faster diagonal movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		set_blend_positions(direction)
	
	var target_speed := direction * player.speed

	## Using cubic_interpolate to smooth velocity
	player.velocity = player.velocity.cubic_interpolate(target_speed, Vector2.ZERO, Vector2.ZERO, 0.5)
	
	## Adjust final velocity value to include delta
	player.velocity.move_toward(target_speed, player.acceleration * delta)
	
	player.move_and_slide()

func set_blend_positions(direction: Vector2):
	animation_tree["parameters/StateMachine/idle/blend_position"] = direction
	animation_tree["parameters/StateMachine/move/blend_position"] = direction
	animation_tree["parameters/Pickup/blend_position"] = direction
