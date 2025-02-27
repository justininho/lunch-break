extends Node2D
class_name Pickup

@export var pickup_state : PickupState = PickupState.new()

func take() -> void:
		pickup_state.taken = true
		Inventory.add_item(pickup_state.item)
