extends InteractionState
class_name LockState

@export var is_locked := true
@export var key : Key

func _init(is_locked: bool = true, key: Key = Key.new(), prompt: String = "Locked"):
	super._init(is_locked, prompt)
	self.is_locked = is_locked
	self.key = key
	
