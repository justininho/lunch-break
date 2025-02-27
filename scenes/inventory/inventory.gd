extends Node

signal item_added(item: Item)
signal item_removed(item: Item)

var items = {}

func add_item(item: Item):
		items[item.item_name] = item
		item_added.emit(item)

func remove_item(item: Item):
		var item_name = item.item_name
		items.erase(item_name)
		item_removed.emit(item_name)
		
# Check if an item is in the inventory
func has_item(item_name: String) -> bool:
		return items.has(item_name)

# Get all items in the inventory
func get_items() -> Array:
		return items.values()
		
func get_item(item_name: String) -> Item:
	return items.get(item_name, null)
