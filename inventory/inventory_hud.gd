extends Panel
class_name Inventory_Hud

@onready var inventory_slots: GridContainer = $MarginContainer/InventorySlots

var slots : Array[Node]

func _ready() -> void:
	Inventory.item_added.connect(add_item)
	Inventory.item_removed.connect(remove_item)
	slots = inventory_slots.get_children()
	assert(slots.size() > 0, "No Inventory Slots")
	
func add_item(item: Item) -> void:
	var i = 0
	while slots[i].item != null:
		i+=1
	slots[i].fill_slot(item)

	pass

	
func remove_item(item_name: String) -> void:
	var i = 0
	while slots[i].item.item_name != item_name:
		i += 1
	slots[i].empty_slot()
	pass
	#for inv_item in h_box_container.get_children():
		#if inv_item.item.item_name == item_name:
			#h_box_container.remove_child(inv_item)
			#inv_item.queue_free()
