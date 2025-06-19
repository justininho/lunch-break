extends State
class_name Player_Move

@export var player : Player
@onready var animation_tree: AnimationTree = %AnimationTree


func update(_delta: float) -> void:
	print('has nav target ', player.has_navigation_target())
	print('velocity: ', player.velocity)
	print('speed: ', player.speed)
	print('on wall: ', player.is_on_wall())
	
	if should_idle():
		print('idle')
		transition.emit(self, "idle")
		#
func should_idle():
	var no_direction = !player.has_direction()
	var no_target = !player.has_navigation_target()
	return no_direction and no_target
	
	
func physics_update(delta: float) -> void:
	if player.has_navigation_target():
		move_navigation(delta)
		
	if player.has_direction():
		move_direction(delta)
	
	
func move_navigation(delta: float) -> void:
	if player.navigation_agent_2d.is_navigation_finished():
		return
	
	var current_player_position = player.global_position
	
	var next_path_position = player.navigation_agent_2d.get_next_path_position()
	var new_velocity = current_player_position.direction_to(next_path_position) * player.speed

	if player.navigation_agent_2d.avoidance_enabled:
		player.navigation_agent_2d.set_velocity(new_velocity)
	else:
		player.velocity = new_velocity
		
	set_blend_positions(new_velocity)
		
	player.move_and_slide()
	#animated_sprite_2d.flip_h = false if velocity.x > 0 else true
		
	

func move_direction(delta: float) -> void:
	if player.has_navigation_target():
		player.clear_navigation_target()
		
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
