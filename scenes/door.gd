extends Interactable
class_name Door

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var door_sfx: AudioStreamPlayer2D = $DoorSfx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_locked():
		door_sfx.stream = preload("res://assets/sfx/door_locked.ogg")
		animated_sprite_2d.play('closed')
	else:
		door_sfx.stream = preload("res://assets/sfx/door_open.ogg")
		animated_sprite_2d.play("open")
		
func interact() -> void:
	try_open()
	
func is_locked() -> bool:
	if has_meta("locked"):
		return get_meta("locked")
	else:
		return false
		
func lock() -> void:
	if has_meta("locked"):
		set_meta("locked", false)
	
func unlock() -> void:
	if has_meta("locked"):
		set_meta("locked", true)
		
func try_open() -> void:
	if is_locked():
		animated_sprite_2d.animation = "locked"
		door_sfx.stream = preload("res://assets/sfx/door_locked.ogg")
	else:
		animated_sprite_2d.animation = "open"
		door_sfx.stream = preload("res://assets/sfx/door_open.ogg")
	animated_sprite_2d.play()
	door_sfx.play()
	
