extends Interactable
class_name Collectible

func collect() -> void:
	pass
	
func interact() -> void:
	queue_free()
