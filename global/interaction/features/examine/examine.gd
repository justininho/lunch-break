extends Node2D
class_name Examine

@export var examine_text: String
@export var examine_state: ExamineState
@onready var interaction_area: InteractionArea = get_parent().get_node("InteractionArea")
@onready var examine_ui: Examine_UI = get_node("/root/Game/HUD/ExamineUI")


func _ready() -> void:
	#assert(examine_state != null, "Examine State is null")
	#assert(examine_ui != null, "Examine UI is null")
	#assert(interaction_area != null, "Interaction Area is null")
	interaction_area.exit.connect(hide_text)
	if !examine_state.manual_interaction:
		interaction_area.interact.connect(show_text)
		
		
func show_text() -> void:
	if examine_ui.visible != true:
		examine_ui.show_text(examine_text)
	else:
		examine_ui.hide_text()
				
				
func hide_text() -> void:
	examine_ui.hide_text()
