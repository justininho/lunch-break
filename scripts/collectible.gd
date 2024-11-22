extends Interactable
class_name Collectible

@export var item : Item

func _ready() -> void:
	super._ready()
	assert(item, "item cannot be null")

func interact() -> void:
	collect()

func collect() -> void:
	Inventory.add_item(item)
	queue_free()
