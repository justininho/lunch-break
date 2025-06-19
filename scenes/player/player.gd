extends CharacterBody2D
class_name Player

@export var speed := 300.0
@export var acceleration := 1200.0
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D


signal navigation_finished

		
func has_direction() -> bool:
	return get_direction() != Vector2.ZERO
	
	
func has_navigation_target() -> bool:
	navigation_agent_2d.get_navigation_map()
	return !navigation_agent_2d.is_navigation_finished()
	
	
func clear_navigation_target() -> void:
	navigation_agent_2d.target_position = global_position
	
	
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


func set_navigation_target(target: Vector2):
	print('setting navigation target', target)
	navigation_agent_2d.target_position = target
	#if navigation_agent_2d.is_navigation_finished():
		#return
	#
	#var current_agent_position = global_position
	#var next_path_position = navigation_agent_2d.get_next_path_position()
	#
	#var new_velocity = current_agent_position.direction_to(next_path_position) * speed
#
	#if navigation_agent_2d.avoidance_enabled:
		#navigation_agent_2d.set_velocity(new_velocity)
	#else:
		#velocity = new_velocity


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	velocity = safe_velocity
