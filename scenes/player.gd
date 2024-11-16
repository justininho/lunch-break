extends CharacterBody2D
class_name Player

@export var speed := 300.0
@export var acceleration := 1200.0
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var interact_area: Area2D = $InteractArea

signal interact

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		_on_player_interact()

func _on_player_interact() -> void:
	# Get overlapping areas (assuming there is an Area2D or a CollisionShape2D called "InteractArea" on your player)
	for obj in interact_area.get_overlapping_areas():
		if obj.is_in_group("collectible"):
			obj.collect()
		if obj.is_in_group("unlockable"):
			obj.unlock()
		if obj.is_in_group("interactable"):
			obj.interact()
			
func has_direction() -> bool:
	return get_direction() != Vector2.ZERO
	
func get_direction() -> Vector2:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
			direction.x += 1
	if Input.is_action_pressed("move_left"):
			direction.x -= 1
	if Input.is_action_pressed("move_down"):
			direction.y += 1
	if Input.is_action_pressed("move_up"):
			direction.y -= 1
	return direction


func _on_inventory_updated(items: Array) -> void:
	pass # Replace with function body.
