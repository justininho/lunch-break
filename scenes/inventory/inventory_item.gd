extends AspectRatioContainer
class_name InventoryItem

@onready var item_texture: TextureRect = $ItemTexture

var item_id : int
var texture = Texture2D
	
func setup(item: Item) -> void:
	item_id = item.id
	assert(item.has_node("Sprite2D"), "Item must have a Sprite2D node")
	var sprite = item.get_node("Sprite2D")
	texture = sprite.texture	
	
func _ready() -> void:
	item_texture.texture = texture
