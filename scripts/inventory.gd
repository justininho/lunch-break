extends Node
class_name Inventory

# The list that will hold all item references
var items = []

# Add an item to the inventory
func add_item(item):
		items.append(item)
		print("Item added: ", item)

# Remove an item from the inventory (by reference or index)
func remove_item(item):
		if item in items:
				items.erase(item)
				print("Item removed: ", item)

# Check if an item is in the inventory
func has_item(item) -> bool:
		return item in items

# Get all items in the inventory
func get_items() -> Array:
		return items
