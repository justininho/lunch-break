extends Interactable
class_name Examinable

@export var examine_text : String
var examine_ui : Examine_UI

func _ready() -> void:
	assert(examine_text != null, "Examine Text is null")
	examine_ui = get_node("/root/Game/HUD/ExamineUI")
	assert(examine_ui != null, "Examine UI is null")

	connect("area_exited", _on_area_exited)

func interact() -> void:
	examine()

func examine() -> void:
	if examine_ui.visible != true:
		examine_ui.show_text(examine_text)
	else:
		examine_ui.hide_text()
				
func _on_area_exited(area: Node) -> void:
	if area.name == "PlayerEntity":
		examine_ui.hide_text()
