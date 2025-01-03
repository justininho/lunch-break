extends PanelContainer
class_name InventorySlot

@onready var texture_rect: TextureRect = $MarginContainer/TextureRect
@export var item: Item

func fill_slot(item: Item) -> void:
	assert(item.inventory_texture != null, "Item texture missing")
	self.item = item
	texture_rect.texture = item.inventory_texture

func empty_slot() -> void:
	self.item = null
	texture_rect.texture = null
