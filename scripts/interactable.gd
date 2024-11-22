extends Entity
class_name Interactable

signal interaction_triggered
signal interaction_area_entered
signal interaction_area_exited

var sprite : Node2D

@export var interaction_state: InteractionState:
	set(new_state):
		interaction_state = new_state
		state_changed.emit()
		
func _ready() -> void:
	super._ready()
	sprite = find_child("*Sprite*", true, false)
	assert(sprite, "Entity node must have a sprite child node.")
	assert(sprite is Sprite2D or sprite is AnimatedSprite2D, "Entity sprite must be a Sprite2D or AnimatedSprite2D.")
	assert(interaction_state, "Interactable node must have an InteractionState child node.")
	add_to_group("interactable")


func add_interact_material() -> void:
	material = interaction_state.highlight_material
	sprite.use_parent_material = true
	
	
func remove_interact_material() -> void:
	sprite.use_parent_material = false
	
	
func interact() -> void:
	if interaction_state.can_interact:
		interaction_triggered.emit()
		
		
func _on_area_entered(area: Node) -> void:
	super._on_area_entered(area)
	if interaction_state.can_interact:
		add_interact_material()
	interaction_area_entered.emit()


func _on_area_exited(area: Node) -> void:
	super._on_area_entered(area)
	if interaction_state.can_interact:
		remove_interact_material()
	interaction_area_exited.emit()
