extends Node

# Signals
signal player_move_requested(target_position)
signal player_reached_destination
signal interaction_ready(interactable)

@onready var player = get_tree().get_first_node_in_group("player")
@onready var tilemap = get_tree().get_first_node_in_group("navigation_tilemap")
var pending_interaction = null

# Core Functions
func _ready():
	if not player:	
		push_error("ClickManager: Player not found. Please add Player to 'player' group.")
		
	if not tilemap:
		push_error("ClickManager: Navigation TileMap not found. Please add TileMap to 'navigation_tilemap' group.")
		
	# Initialize the manager, connect to required signals
	# Connect to player's navigation finished signal
	if player and player.has_signal("navigation_finished"):
			if not player.is_connected("navigation_finished", _on_player_reached_destination):
				player.navigation_finished.connect(_on_player_reached_destination)
	else:
		push_warning("ClickManager: Player does not have 'navigation_finished' signal. Movement-then-interaction won't work.")
	
	
func _unhandled_input(event: InputEvent) -> void:
	# Handle clicks on empty space - typically for movement
	# This gets called automatically by Godot for inputs not handled by other nodes
	if Input.is_action_just_pressed("left_click") or Input.is_action_pressed("left_click"):
		# Send the target position to the player's navigation agent
		player.set_navigation_target(get_centered_tile_position())
	pass
	
func get_centered_tile_position() -> Vector2:
	# Get the current active Camera2D node in the viewport
	var camera = get_viewport().get_camera_2d()
	
	# Get the global mouse position in world coordinates
	# This gives us where in the world space the mouse is pointing
	var global_pos = camera.get_global_mouse_position()
	
	# Convert the global world position to local tilemap coordinates
	# to_local(): Transforms global_pos from world space to tilemap's local space
	# local_to_map(): Converts the local position to discrete tile/cell coordinates (Vector2i)
	var cell_coords = tilemap.local_to_map(tilemap.to_local(global_pos))
	
	# Convert back to world position at cell center (for navigation)
	# map_to_local(): Transforms the discrete cell coordinates back to a continuous
	# world position, but now centered on the tile/cell
	# This ensures the target is at the center of the tile rather than at the exact mouse position
	var target_position = tilemap.map_to_local(cell_coords)

	# Return the world position at the center of the tile under the mouse cursor
	# This position can be used by navigation systems like NavigationAgent2D
	return target_position

func request_move_and_interact(interactable):
	# Start the move-then-interact sequence
	pass


func calculate_interaction_position(interactable):
	# Calculate where player should stand to interact with object
	pass


# Callback Functions
func _on_player_reached_destination():
	# Called when player arrives at destination
	# Should trigger pending interaction if one exists
	pass
