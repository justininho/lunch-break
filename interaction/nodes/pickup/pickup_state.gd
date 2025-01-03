extends Resource
class_name PickupState

# used to keep track if an item has been picked up

@export var is_taken := false
@export var item : Item

func _init(is_taken: bool = false, item: Item = Item.new()):
	self.is_taken = is_taken
	self.item = item
