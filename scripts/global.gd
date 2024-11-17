extends Node

var global_id = 0

func generate_unique_id():
		global_id += 1
		return global_id
