extends AspectRatioContainer
class_name InventoryItem

@onready var texture: TextureRect = $texture

var item : Item

func setup(item: Item) -> void:
	self.item = item
	
func _ready() -> void:
	texture.texture = item.inventory_texture
