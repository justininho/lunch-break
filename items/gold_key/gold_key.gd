extends Sprite2D
class_name GoldKey

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var pickup: Pickup = $Pickup

func _on_interaction_area_interact() -> void:
	pickup.take()
	queue_free()
