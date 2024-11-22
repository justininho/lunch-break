extends GridContainer
class_name Inventory_Hud

@onready var h_box_container: HBoxContainer = $MarginContainer/HBoxContainer
const inventory_item_scene := preload("res://scenes/inventory_item.tscn")

func _ready() -> void:
	Inventory.item_added.connect(add_item)
	Inventory.item_removed.connect(remove_item)

func add_item(item: Item) -> void:
	var inv_item = inventory_item_scene.instantiate()
	inv_item.setup(item)
	h_box_container.add_child(inv_item)
	
func remove_item(item_name: String) -> void:
	for inv_item in h_box_container.get_children():
		if inv_item.item.item_name == item_name:
			h_box_container.remove_child(inv_item)
			inv_item.queue_free()
