extends Control
#class_name Examine_UI

@onready var examine_label: Label = %ExamineLabel

#func _init(examine_text: String) -> void:
	#examine_label.text = examine_text

func _ready() -> void:
	pass
	#visible = false
	
func show_text(examine_text: String) -> void:
	print('test')
	examine_label.text = examine_text
	visible = true
