extends Interactable
class_name Examinable

@export var examine_text : String
var examine_ui : Examine_UI

func _ready() -> void:
	super._ready()
	assert(examine_text != null, "Examine Text is null")
	examine_ui = get_node("/root/Game/HUD/ExamineUI")
	assert(examine_ui != null, "Examine UI is null")
	connect("interaction_triggered", examine)
	connect("interaction_area_exited", close_examine)
	#connect("area_exited", _on_area_exited)

func examine() -> void:
	if examine_ui.visible != true:
		examine_ui.show_text(examine_text)
	else:
		examine_ui.hide_text()
				
func close_examine(area: Node) -> void:
	if area.name == "PlayerEntity":
		examine_ui.hide_text()
