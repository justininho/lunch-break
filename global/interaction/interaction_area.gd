extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"
@export var interaction_state : InteractionState = InteractionState.new()

signal interact()

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)


func _on_area_entered(area: Area2D) -> void:
	show_shader()
	InteractionManager.register_area(self)


func _on_area_exited(area: Area2D) -> void:
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
