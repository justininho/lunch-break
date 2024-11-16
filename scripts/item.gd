extends Collectible
class_name Item

var id: int

func _init(): 
	id = Global.generate_unique_id()
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
