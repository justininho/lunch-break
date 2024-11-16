extends Unlockable
class_name Door

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var door_sfx: AudioStreamPlayer2D = $DoorSfx
@onready var open_collision: CollisionShape2D = $StaticBody2D/OpenCollision
@onready var close_collision: CollisionShape2D = $StaticBody2D/CloseCollision

func interact() -> void:
	try_open()
		
func try_open() -> void:
	var anim = animated_sprite_2d.animation
	if anim == "open":
		return
	if locked == true:
		animated_sprite_2d.animation = "locked"
		door_sfx.stream = preload("res://assets/sfx/door_locked.ogg")
	else:
		animated_sprite_2d.animation = "open"
		door_sfx.stream = preload("res://assets/sfx/door_open.ogg")
		open_collision.disabled = false
		close_collision.disabled = true
		
	animated_sprite_2d.play()
	door_sfx.play()
	
