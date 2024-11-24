extends Resource
class_name InteractionState

@export var can_interact := true
@export var interaction_prompt := "Press E to interact"
@export var highlight_material: ShaderMaterial = preload("res://resources/interactable_material.tres")

func _init(can_interact: bool = true, prompt: String = "Press E to interact", material: ShaderMaterial = preload("res://resources/interactable_material.tres")):
	self.can_interact = can_interact
	self.interaction_prompt = prompt
	self.highlight_material = material
