extends Interactable
class_name Collectible

@export var item : Item

func interact() -> void:
	collect()

func collect() -> void:
	Inventory.add_item(item.duplicate())
	queue_free()
