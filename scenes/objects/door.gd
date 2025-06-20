extends Node2D
class_name Door

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var door_sfx: AudioStreamPlayer2D = $DoorSfx
@onready var close_collision: CollisionShape2D = $CloseCollision
@onready var open_collision: CollisionShape2D = $OpenCollision

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var lock: Lock = $Lock
@onready var examine: Examine = $Examine


func _on_interaction_area_interact() -> void:
	lock.try_unlock()


func _on_unlocked() -> void:
	play_unlocked()


func _on_locked() -> void:
	play_locked()
	cooldown()
	
	
func play_unlocked() -> void:
	animated_sprite_2d.play("open")
	door_sfx.stream = preload("res://assets/door_open.ogg")
	open_collision.disabled = false
	close_collision.disabled = true
	door_sfx.play()
	interaction_area.interaction_state.can_interact = false
	
	
func play_locked() -> void:
	animated_sprite_2d.play("locked")
	door_sfx.stream = preload("res://assets/door_locked.ogg")
	door_sfx.play()

	
func cooldown() -> void:
	examine.show_text()
	interaction_area.interaction_state.can_interact = false
	await get_tree().create_timer(1).timeout
	interaction_area.interaction_state.can_interact = true
	examine.hide_text()
	
