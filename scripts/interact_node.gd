extends Node2D
class_name Interact_Node

@export var can_interact := true
@onready var label: Label = $Label

var sprite : Node2D
var sprite_material : ShaderMaterial

signal test()

func _ready() -> void:
	pass
	#var parent = get_parent()
	#assert(parent.name != "Entity", "Interact Node must be a child of Entity")
	#print(parent.get_children())
	#
	#sprite = parent.find_child("*Sprite*")
	#
	#assert(sprite != null, "Entity must have a sprite")
	#
	#connect("area_entered", _on_area_entered)
	#connect("area_exited", _on_area_exited)
	#sprite_material = ShaderMaterial.new()
	#var shader = preload("res://select.gdshader")
	#sprite_material.shader = shader
	##todo: change shader color? 
	#sprite_material["shader_parameter/is_horizontal"] = true
	#sprite["material"] = sprite_material
	#disable_shader()
	
func interact() -> void:
	test.emit()
	#interacted.emit(self)
	action()
	
func action() -> void:
	pass

func _on_area_entered(area: Node) -> void:
	print('area entered child node')
	sprite_material["shader_parameter/speed"] = 0.5
	sprite["material"] = sprite_material
	#visible = true

func _on_area_exited(area: Node) -> void:
	print('area exited child node')
	disable_shader()
	#visible = false
	
func disable_shader() -> void:
	sprite_material["shader_parameter/speed"] = 0
	
func enable_shader() -> void:
	sprite_material["shader_parameter/speed"] = 0.5
	
