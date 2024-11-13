extends CharacterBody2D
class_name Player

@export var speed := 300.0
@export var acceleration := 1200.0
@onready var animation_tree: AnimationTree = $AnimationTree

func has_direction() -> bool:
	return get_direction() != Vector2.ZERO
	
func get_direction() -> Vector2:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
			direction.x += 1
	if Input.is_action_pressed("move_left"):
			direction.x -= 1
	if Input.is_action_pressed("move_down"):
			direction.y += 1
	if Input.is_action_pressed("move_up"):
			direction.y -= 1
	return direction
	
func move(delta: float) -> void:
	var direction := get_direction()
	
	## Normalize direction to prevent faster diagonal movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		set_blend_positions(direction)
	
	var target_speed := direction * speed

	## Using cubic_interpolate to smooth velocity
	velocity = velocity.cubic_interpolate(target_speed, Vector2.ZERO, Vector2.ZERO, 0.5)
	
	## Adjust final velocity value to include delta
	velocity.move_toward(target_speed, acceleration * delta)
	
	move_and_slide()

func set_blend_positions(direction: Vector2):
	animation_tree["parameters/StateMachine/idle/blend_position"] = direction
	animation_tree["parameters/StateMachine/move/blend_position"] = direction
