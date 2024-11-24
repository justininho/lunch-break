extends CharacterBody2D
class_name Player

@export var speed := 300.0
@export var acceleration := 1200.0
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_player: AnimationPlayer = %AnimationPlayer
#@onready var interaction_area: InteractionArea = $InteractionArea
#@onready var interaction: Area2D = $Interaction

signal interact

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		_on_player_interact()

func _on_player_interact() -> void:
	#print(interaction_area.get_overlapping_areas())
	#for entity in player_entity.get_overlapping_areas():
		#if entity is Collectible:
			#animation_tree["parameters/PickupOneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE
		#if entity is Interactable:
			#entity.interact()
	pass
	
		
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
