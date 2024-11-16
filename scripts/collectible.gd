extends Interactable
class_name Collectible

var texture : Texture2D

func collect() -> void:
	Inventory.add_item(self)
	
func interact() -> void:
	queue_free()
