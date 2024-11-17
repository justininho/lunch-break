extends Node2D
class_name Item

var id: int
@export var inventory_texture : Texture2D

func _init():
	id = Global.generate_unique_id()
