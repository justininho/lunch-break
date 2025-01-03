extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"
@export var interaction_state : InteractionState = InteractionState.new()

signal interact
signal interaction_area_entered
signal interaction_area_exited

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	
	for child in get_children():
		if child is InteractionNode:
			connect("interact", child._on_interact)
			connect("interaction_area_entered", child._on_interaction_area_entered)
			connect("interaction_area_exited", child._on_interaction_area_exited)

func _on_area_entered(area: Area2D) -> void:
	interaction_area_entered.emit()
	show_shader()
	InteractionManager.register_area(self)


func _on_area_exited(area: Area2D) -> void:
	interaction_area_exited.emit()
	hide_shader()
	InteractionManager.unregister_area(self)
	
	
func show_shader() -> void:
	var parent = get_parent()
	if parent:
		parent.material = interaction_state.highlight_material
	
	
func hide_shader() -> void:
	var parent = get_parent()
	if parent:
		parent.material = null
