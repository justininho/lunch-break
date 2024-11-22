extends Node2D
class_name FloatingPrompt

@onready var label: Label = $Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var animation : Animation

func _ready() -> void:
		# Create hover animation
		animation = Animation.new()
		var track_index = animation.add_track(Animation.TYPE_VALUE)
		animation.track_set_path(track_index, ":position:y")
		animation.track_insert_key(track_index, 0.0, 0.0)
		animation.track_insert_key(track_index, 0.5, -5)  # Moves up 5 pixels
		animation.track_insert_key(track_index, 1.0, 0.0)
		animation.loop_mode = Animation.LOOP_LINEAR
		animation.resource_name = "hover"
		# Add animation to player
		#animation_player.
		print(animation)
		animation_player.play("hover")
		#animation_player.add_animation("hover", animation)
		
		# Hide initially
		hide()

func display_prompt(text: String) -> void:
		label.text = text
		show()
		animation_player.play("hover")

func hide_prompt() -> void:
		hide()
		animation_player.stop()
