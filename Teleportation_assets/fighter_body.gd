extends CharacterBody2D


var inventory: Array[String] = []

func has_item(item_name: String) -> bool:
	return item_name in inventory
	
func pickup_item(item_name: String) -> void:
	if not has_item(item_name):
		inventory.append(item_name)
		print("Picked up: ", item_name)
