extends InteractionNode
class_name Pickup

signal taken

@export var pickup_text = "Take item?"
@export var pickup_yes = "Yes"
@export var pickup_no = "No"
@export var pickup_state : PickupState = PickupState.new()
	
#func _ready() -> void:
	#Dialogic.Choices.choice_selected(_on_choice_selected)
	
		
func _show_dialog() -> void:
	if Dialogic.current_timeline != null:
		return
		
	Dialogic.signal_event.connect(_on_choice_selected)
	Dialogic.VAR.pickup_text = pickup_text
	Dialogic.VAR.pickup_yes = pickup_yes
	Dialogic.VAR.pickup_no = pickup_no
	Dialogic.start("pickup")


func _on_choice_selected(choice: String) -> void:
	if choice == "yes": 
		take()
	
	Dialogic.signal_event.disconnect(_on_choice_selected)
		
func take() -> void:
	pickup_state.is_taken = true
	Inventory.add_item(pickup_state.item)
	taken.emit()
