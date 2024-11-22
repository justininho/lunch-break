extends Node
class_name State_Machine

@export var player : Player
@export var initial_state : State

var states := {}
var current_state : State = null

func _ready():
	assert(player != null, "State Machine must have a player")
		
	for child in get_children():
		if child is State:
			states[child.get_name().to_lower()] = child
			child.transition.connect(on_transition)
			child.player = player

	if initial_state:
		current_state = initial_state
		initial_state.enter()

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

func on_transition(state: State, next_state_name: String) -> void:
		if state != current_state:
				return

		var next_state = states[next_state_name.to_lower()]
		if !next_state:
				return

		if current_state:
				current_state.exit()

		current_state = next_state
		
func is_idle() -> bool:
	return current_state.get_name().to_lower() == 'idle'
	
func is_move() -> bool:
	return current_state.get_name().to_lower() == 'move'
