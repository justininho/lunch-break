extends Area2D
class_name Entity

var id : int

func _init() -> void:
	id = Global.generate_unique_id()

func _ready() -> void:
	pass
