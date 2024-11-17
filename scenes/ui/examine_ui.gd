extends Control
class_name Examine_UI

@onready var label: Label = %Label
var player : Player

func _ready() -> void:
	visible = false
	
func show_text(examine_text: String) -> void:
	label.text = examine_text
	visible = true

func hide_text() -> void:
	visible = false
