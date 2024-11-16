extends Node

var global_item_id = 0

func generate_unique_id():
		global_item_id += 1
		return global_item_id
