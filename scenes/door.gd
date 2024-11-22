extends Lockable
class_name Door

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var door_sfx: AudioStreamPlayer2D = $DoorSfx
@onready var open_collision: CollisionShape2D = $StaticBody2D/OpenCollision
@onready var close_collision: CollisionShape2D = $StaticBody2D/CloseCollision
	
func _on_unlocked() -> void:
	animated_sprite_2d.play("open")
	door_sfx.stream = preload("res://assets/door_open.ogg")
	open_collision.disabled = false
	close_collision.disabled = true
	door_sfx.play()
	
func _on_locked() -> void:
	animated_sprite_2d.play("locked")
	door_sfx.stream = preload("res://assets/door_locked.ogg")
	door_sfx.play()
