extends InteractionNode
class_name Examine

@export var examine_text: String
@export var timeline := "examine"

	
func _show_dialog() -> void:
	if Dialogic.current_timeline != null:
		return
	
	Dialogic.VAR.examine_text = examine_text
	Dialogic.start(timeline)


func _on_interaction_area_exited() -> void:
	Dialogic.end_timeline()
