extends Area2D
class_name Entity

signal state_changed
@export var entity_name : String

func _ready() -> void:
	
	# find child node that is either a Sprite2D or AnimatedSprite2D
	add_to_group("entities")
	connect("area_entered", _on_area_entered)
	connect("area_exited", _on_area_exited)
	
func _on_area_entered(area: Node) -> void:
	pass
	
func _on_area_exited(area: Node) -> void:
	pass
