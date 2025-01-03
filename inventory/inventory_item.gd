extends AspectRatioContainer
class_name InventoryItem

@onready var texture: TextureRect = $texture

var item : Item

func fill(item: Item) -> void:
	self.item = item
	texture.texture = item.inventory_texture
	
