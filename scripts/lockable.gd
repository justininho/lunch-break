extends Interactable
class_name Lockable

signal locked
signal unlocked

var lock: LockState

func _ready() -> void:
	super._ready()
	assert(interaction_state is LockState, "Lockable node must have a LockState child node.")
	lock = interaction_state
	connect("interaction_triggered", try_unlock)
	
	
func try_unlock() -> void:
	if lock.is_locked == false:
		return

	if Inventory.has_item(lock.key.item_name): 
		lock.is_locked = false
		lock.can_interact = false
		Inventory.remove_item(lock.key)
		remove_interact_material()
		_on_unlocked() 
		state_changed.emit()
	else: 
		_on_locked()
		
		
func _on_locked() -> void:
	pass
	
	
func _on_unlocked() -> void:
	pass
