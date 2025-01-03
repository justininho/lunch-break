extends Node2D
class_name InteractionNode

var interaction : Callable = _show_dialog

func _show_dialog() -> void:
	pass


func _on_interact() -> void:
	interaction.call()
	

func _on_interaction_area_entered() -> void:
	pass
	
	
func _on_interaction_area_exited() -> void:
	pass
