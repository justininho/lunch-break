extends Node2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var label: Label = $Label

const base_text = "[Enter] to "

var active_areas = []
var can_interact = true

signal interact

func register_area(area: InteractionArea):
	active_areas.push_back(area)
	

func unregister_area(area: InteractionArea):
	var i := active_areas.find(area)
	if i != -1:
		active_areas.remove_at(i)
		
		
func _sort_by_distance_to_player(area1: InteractionArea, area2: InteractionArea):
	var area1_to_player = player.global_position.distance_to(area1.global_position)
	var area2_to_player = player.global_position.distance_to(area2.global_position)
	return area1_to_player < area2_to_player


# refactor this to use interaction state
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and active_areas.size() > 0:
		var active_area = active_areas[0]
		if active_area.interaction_state.can_interact:
			active_area.interact.emit()
