extends Node2D
class_name Lock

signal locked
signal unlocked

@export var lock_state: LockState

func try_unlock() -> void:
	if lock_state.is_locked == false:
		return
		
	if Inventory.has_item(lock_state.item.item_name): 
		lock_state.is_locked = false
		#lock_state.can_interact = false
		Inventory.remove_item(lock_state.item)
		#remove_interact_material()
		#_on_unlocked() 
		unlocked.emit()
		#state_changed.emit()
	else: 
		locked.emit()
