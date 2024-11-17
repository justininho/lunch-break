extends Node

signal item_added(item: Item)
signal item_removed(item: Item)

var items = {}

func add_item(item: Item):
		var item_copy = item.duplicate()
		items[item.id] = item_copy
		item_added.emit(item_copy)

func remove_item(item: Item):
		items.erase(item.id)
		print('items after erase: ', get_items())
		item_removed.emit(item.id)

# Check if an item is in the inventory
func has_item(item_id: int) -> bool:
		return items.has(item_id)

# Get all items in the inventory
func get_items() -> Array:
		return items.values()
		
func get_item(item_id: int) -> Item:
	return items.get(item_id, null)
