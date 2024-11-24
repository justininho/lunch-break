extends Resource
class_name LockState

@export var is_locked := true
@export var item : Item

signal unlocked()
signal locked()

func _init(is_locked: bool = true, item: Item = Item.new(), prompt: String = "Locked"):
	self.is_locked = is_locked
	self.item = item
