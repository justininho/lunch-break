extends InteractionState
class_name PickupState

# used to keep track if an item has been picked up

@export var taken := false
@export var item : Item

func _init(taken: bool = false, item: Item = Item.new()):
		self.taken = taken
		self.item = item
