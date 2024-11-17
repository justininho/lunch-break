extends Interactable
class_name Unlockable

@export var unlock_id := 0
var locked := true

func interact() -> void:
	unlock()

func unlock() -> void:
	if locked == false:
		return
		
	for item in Inventory.get_items():
		if item is Key:
			if item.unlock_id == unlock_id:
				locked = false
				Inventory.remove_item(item)
