extends InteractionNode
class_name Lock

signal locked
signal unlocked

@export var lock_state: LockState
@export var yes_no_description = "The door is locked."
@export var yes_text = "Open"
@export var no_text = "Leave"
	
#func _ready() -> void:
	#
	#Dialogic.timeline_ended.connect(_test)
	#

func _test():
	print('done')	

func _show_dialog() -> void:
	if Dialogic.current_timeline != null:
		return
	
	#Dialogic.signal_event.connect(_on_choice_selected)
	Dialogic.VAR.yes_no_description = yes_no_description
	Dialogic.VAR.yes_text = yes_text
	Dialogic.VAR.no_text = no_text
	Dialogic.start("yes_no_timeline")
	
	
#func	 _on_choice_selected(choice: String):
	#if choice == "yes":
		#try_unlock()
		#
	#Dialogic.signal_event.disconnect(_on_choice_selected)


func try_unlock() -> void:
	if lock_state.is_locked == false:
		return
		
	if Inventory.has_item(lock_state.item.item_name): 
		lock_state.is_locked = false
		Inventory.remove_item(lock_state.item.item_name)
		unlocked.emit()
	else:
		locked.emit()
